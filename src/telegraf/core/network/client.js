"use strict";

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

var debug = require('debug')('telegraf:client');

var crypto = require('crypto');

var fetch = require('node-fetch')["default"];

var fs = require('fs');

var https = require('https');

var path = require('path');

var TelegramError = require('./error');

var MultipartStream = require('./multipart-stream');

var isStream = MultipartStream.isStream;
var WEBHOOK_BLACKLIST = ['getChat', 'getChatAdministrators', 'getChatMember', 'getChatMembersCount', 'getFile', 'getFileLink', 'getGameHighScores', 'getMe', 'getUserProfilePhotos', 'getWebhookInfo', 'exportChatInviteLink'];
var DEFAULT_EXTENSIONS = {
  audio: 'mp3',
  photo: 'jpg',
  sticker: 'webp',
  video: 'mp4',
  animation: 'mp4',
  video_note: 'mp4',
  voice: 'ogg'
};
var DEFAULT_OPTIONS = {
  apiRoot: 'https://api.telegram.org',
  webhookReply: true,
  agent: new https.Agent({
    keepAlive: true,
    keepAliveMsecs: 10000
  })
};
var WEBHOOK_REPLY_STUB = {
  webhook: true,
  details: 'https://core.telegram.org/bots/api#making-requests-when-getting-updates'
};

function safeJSONParse(text) {
  try {
    return JSON.parse(text);
  } catch (err) {
    debug('JSON parse failed', err);
  }
}

function includesMedia(payload) {
  return Object.keys(payload).some(function (key) {
    var value = payload[key];

    if (Array.isArray(value)) {
      return value.some(function (_ref) {
        var media = _ref.media;
        return media && _typeof(media) === 'object' && (media.source || media.url);
      });
    }

    return _typeof(value) === 'object' && (value.source || value.url || _typeof(value.media) === 'object' && (value.media.source || value.media.url));
  });
}

function buildJSONConfig(payload) {
  return Promise.resolve({
    method: 'POST',
    compress: true,
    headers: {
      'content-type': 'application/json',
      connection: 'keep-alive'
    },
    body: JSON.stringify(payload)
  });
}

var FORM_DATA_JSON_FIELDS = ['results', 'reply_markup', 'mask_position', 'shipping_options', 'errors'];

function buildFormDataConfig(payload, agent) {
  var _iterator = _createForOfIteratorHelper(FORM_DATA_JSON_FIELDS),
      _step;

  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var field = _step.value;

      if (field in payload && typeof payload[field] !== 'string') {
        payload[field] = JSON.stringify(payload[field]);
      }
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }

  var boundary = crypto.randomBytes(32).toString('hex');
  var formData = new MultipartStream(boundary);
  var tasks = Object.keys(payload).map(function (key) {
    return attachFormValue(formData, key, payload[key], agent);
  });
  return Promise.all(tasks).then(function () {
    return {
      method: 'POST',
      compress: true,
      headers: {
        'content-type': "multipart/form-data; boundary=".concat(boundary),
        connection: 'keep-alive'
      },
      body: formData
    };
  });
}

function attachFormValue(form, id, value, agent) {
  if (!value) {
    return Promise.resolve();
  }

  var valueType = _typeof(value);

  if (valueType === 'string' || valueType === 'boolean' || valueType === 'number') {
    form.addPart({
      headers: {
        'content-disposition': "form-data; name=\"".concat(id, "\"")
      },
      body: "".concat(value)
    });
    return Promise.resolve();
  }

  if (id === 'thumb') {
    var attachmentId = crypto.randomBytes(16).toString('hex');
    return attachFormMedia(form, value, attachmentId, agent).then(function () {
      return form.addPart({
        headers: {
          'content-disposition': "form-data; name=\"".concat(id, "\"")
        },
        body: "attach://".concat(attachmentId)
      });
    });
  }

  if (Array.isArray(value)) {
    return Promise.all(value.map(function (item) {
      if (_typeof(item.media) !== 'object') {
        return Promise.resolve(item);
      }

      var attachmentId = crypto.randomBytes(16).toString('hex');
      return attachFormMedia(form, item.media, attachmentId, agent).then(function () {
        return _objectSpread(_objectSpread({}, item), {}, {
          media: "attach://".concat(attachmentId)
        });
      });
    })).then(function (items) {
      return form.addPart({
        headers: {
          'content-disposition': "form-data; name=\"".concat(id, "\"")
        },
        body: JSON.stringify(items)
      });
    });
  }

  if (typeof value.media !== 'undefined' && typeof value.type !== 'undefined') {
    var _attachmentId = crypto.randomBytes(16).toString('hex');

    return attachFormMedia(form, value.media, _attachmentId, agent).then(function () {
      return form.addPart({
        headers: {
          'content-disposition': "form-data; name=\"".concat(id, "\"")
        },
        body: JSON.stringify(_objectSpread(_objectSpread({}, value), {}, {
          media: "attach://".concat(_attachmentId)
        }))
      });
    });
  }

  return attachFormMedia(form, value, id, agent);
}

function attachFormMedia(form, media, id, agent) {
  var fileName = media.filename || "".concat(id, ".").concat(DEFAULT_EXTENSIONS[id] || 'dat');

  if (media.url) {
    return fetch(media.url, {
      agent: agent
    }).then(function (res) {
      return form.addPart({
        headers: {
          'content-disposition': "form-data; name=\"".concat(id, "\"; filename=\"").concat(fileName, "\"")
        },
        body: res.body
      });
    });
  }

  if (media.source) {
    if (fs.existsSync(media.source)) {
      fileName = media.filename || path.basename(media.source);
      media.source = fs.createReadStream(media.source);
    }

    if (isStream(media.source) || Buffer.isBuffer(media.source)) {
      form.addPart({
        headers: {
          'content-disposition': "form-data; name=\"".concat(id, "\"; filename=\"").concat(fileName, "\"")
        },
        body: media.source
      });
    }
  }

  return Promise.resolve();
}

function isKoaResponse(response) {
  return typeof response.set === 'function' && _typeof(response.header) === 'object';
}

function answerToWebhook(response) {
  var payload = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
  var options = arguments.length > 2 ? arguments[2] : undefined;

  if (!includesMedia(payload)) {
    if (isKoaResponse(response)) {
      response.body = payload;
      return Promise.resolve(WEBHOOK_REPLY_STUB);
    }

    if (!response.headersSent) {
      response.setHeader('content-type', 'application/json');
    }

    return new Promise(function (resolve) {
      if (response.end.length === 2) {
        response.end(JSON.stringify(payload), 'utf-8');
        return resolve(WEBHOOK_REPLY_STUB);
      }

      response.end(JSON.stringify(payload), 'utf-8', function () {
        return resolve(WEBHOOK_REPLY_STUB);
      });
    });
  }

  return buildFormDataConfig(payload, options.agent).then(function (_ref2) {
    var headers = _ref2.headers,
        body = _ref2.body;

    if (isKoaResponse(response)) {
      Object.keys(headers).forEach(function (key) {
        return response.set(key, headers[key]);
      });
      response.body = body;
      return Promise.resolve(WEBHOOK_REPLY_STUB);
    }

    if (!response.headersSent) {
      Object.keys(headers).forEach(function (key) {
        return response.setHeader(key, headers[key]);
      });
    }

    return new Promise(function (resolve) {
      response.on('finish', function () {
        return resolve(WEBHOOK_REPLY_STUB);
      });
      body.pipe(response);
    });
  });
}

var ApiClient = /*#__PURE__*/function () {
  function ApiClient(token, options, webhookResponse) {
    _classCallCheck(this, ApiClient);

    this.token = token;
    this.options = _objectSpread(_objectSpread({}, DEFAULT_OPTIONS), options);

    if (this.options.apiRoot.startsWith('http://')) {
      this.options.agent = null;
    }

    this.response = webhookResponse;
  }

  _createClass(ApiClient, [{
    key: "callApi",
    value: function callApi(method) {
      var data = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};
      var token = this.token,
          options = this.options,
          response = this.response,
          responseEnd = this.responseEnd;
      var payload = Object.keys(data).filter(function (key) {
        return typeof data[key] !== 'undefined' && data[key] !== null;
      }).reduce(function (acc, key) {
        return _objectSpread(_objectSpread({}, acc), {}, _defineProperty({}, key, data[key]));
      }, {});

      if (options.webhookReply && response && !responseEnd && !WEBHOOK_BLACKLIST.includes(method)) {
        debug('Call via webhook', method, payload);
        this.responseEnd = true;
        return answerToWebhook(response, _objectSpread({
          method: method
        }, payload), options);
      }

      if (!token) {
        throw new TelegramError({
          error_code: 401,
          description: 'Bot Token is required'
        });
      }

      debug('HTTP call', method, payload);
      var buildConfig = includesMedia(payload) ? buildFormDataConfig(_objectSpread({
        method: method
      }, payload), options.agent) : buildJSONConfig(payload);
      return buildConfig.then(function (config) {
        var apiUrl = "".concat(options.apiRoot, "/bot").concat(token, "/").concat(method);
        config.agent = options.agent;
        return fetch(apiUrl, config);
      }).then(function (res) {
        return res.text();
      }).then(function (text) {
        return safeJSONParse(text) || {
          error_code: 500,
          description: 'Unsupported http response from Telegram',
          response: text
        };
      }).then(function (data) {
        if (!data.ok) {
          debug('API call failed', data);
          throw new TelegramError(data, {
            method: method,
            payload: payload
          });
        }

        return data.result;
      });
    }
  }, {
    key: "webhookReply",
    set: function set(enable) {
      this.options.webhookReply = enable;
    },
    get: function get() {
      return this.options.webhookReply;
    }
  }]);

  return ApiClient;
}();

module.exports = ApiClient;