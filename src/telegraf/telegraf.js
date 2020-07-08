"use strict";

function _typeof(obj) { "@babel/helpers - typeof"; if (typeof Symbol === "function" && typeof Symbol.iterator === "symbol") { _typeof = function _typeof(obj) { return typeof obj; }; } else { _typeof = function _typeof(obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }; } return _typeof(obj); }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function"); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, writable: true, configurable: true } }); if (superClass) _setPrototypeOf(subClass, superClass); }

function _setPrototypeOf(o, p) { _setPrototypeOf = Object.setPrototypeOf || function _setPrototypeOf(o, p) { o.__proto__ = p; return o; }; return _setPrototypeOf(o, p); }

function _createSuper(Derived) { var hasNativeReflectConstruct = _isNativeReflectConstruct(); return function _createSuperInternal() { var Super = _getPrototypeOf(Derived), result; if (hasNativeReflectConstruct) { var NewTarget = _getPrototypeOf(this).constructor; result = Reflect.construct(Super, arguments, NewTarget); } else { result = Super.apply(this, arguments); } return _possibleConstructorReturn(this, result); }; }

function _possibleConstructorReturn(self, call) { if (call && (_typeof(call) === "object" || typeof call === "function")) { return call; } return _assertThisInitialized(self); }

function _assertThisInitialized(self) { if (self === void 0) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return self; }

function _isNativeReflectConstruct() { if (typeof Reflect === "undefined" || !Reflect.construct) return false; if (Reflect.construct.sham) return false; if (typeof Proxy === "function") return true; try { Date.prototype.toString.call(Reflect.construct(Date, [], function () {})); return true; } catch (e) { return false; } }

function _getPrototypeOf(o) { _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf : function _getPrototypeOf(o) { return o.__proto__ || Object.getPrototypeOf(o); }; return _getPrototypeOf(o); }

var debug = require('debug')('telegraf:core');

var Telegram = require('./telegram');

var Extra = require('./extra');

var Composer = require('./composer');

var Markup = require('./markup');

var session = require('./session');

var Router = require('./router');

var Stage = require('./stage');

var BaseScene = require('./scenes/base');

var Context = require('./context');

var generateCallback = require('./core/network/webhook');

var crypto = require('crypto');

var _require = require('url'),
    URL = _require.URL;

var DEFAULT_OPTIONS = {
  retryAfter: 1,
  handlerTimeout: 0,
  contextType: Context
};

var noop = function noop() {};

var Telegraf = /*#__PURE__*/function (_Composer) {
  _inherits(Telegraf, _Composer);

  var _super = _createSuper(Telegraf);

  function Telegraf(token, options) {
    var _this;

    _classCallCheck(this, Telegraf);

    _this = _super.call(this);
    _this.options = _objectSpread(_objectSpread({}, DEFAULT_OPTIONS), options);
    _this.token = token;

    _this.handleError = function (err) {
      console.error();
      console.error((err.stack || err.toString()).replace(/^/gm, '  '));
      console.error();
      throw err;
    };

    _this.context = {};
    _this.polling = {
      offset: 0,
      started: false
    };
    return _this;
  }

  _createClass(Telegraf, [{
    key: "catch",

    /* eslint brace-style: 0 */
    value: function _catch(handler) {
      this.handleError = handler;
      return this;
    }
  }, {
    key: "webhookCallback",
    value: function webhookCallback() {
      var _this2 = this;

      var path = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '/';
      return generateCallback(path, function (update, res) {
        return _this2.handleUpdate(update, res);
      }, debug);
    }
  }, {
    key: "startPolling",
    value: function startPolling() {
      var timeout = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : 30;
      var limit = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : 100;
      var allowedUpdates = arguments.length > 2 ? arguments[2] : undefined;
      var stopCallback = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : noop;
      this.polling.timeout = timeout;
      this.polling.limit = limit;
      this.polling.allowedUpdates = allowedUpdates ? Array.isArray(allowedUpdates) ? allowedUpdates : ["".concat(allowedUpdates)] : null;
      this.polling.stopCallback = stopCallback;

      if (!this.polling.started) {
        this.polling.started = true;
        this.fetchUpdates();
      }

      return this;
    }
  }, {
    key: "startWebhook",
    value: function startWebhook(hookPath, tlsOptions, port, host, cb) {
      var webhookCb = this.webhookCallback(hookPath);
      var callback = cb && typeof cb === 'function' ? function (req, res) {
        return webhookCb(req, res, function () {
          return cb(req, res);
        });
      } : webhookCb;
      this.webhookServer = tlsOptions ? require('https').createServer(tlsOptions, callback) : require('http').createServer(callback);
      this.webhookServer.listen(port, host, function () {
        debug('Webhook listening on port: %s', port);
      });
      return this;
    }
  }, {
    key: "launch",
    value: function launch() {
      var _this3 = this;

      var config = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
      debug('Connecting to Telegram');
      return this.telegram.getMe().then(function (botInfo) {
        debug("Launching @".concat(botInfo.username));
        _this3.options.username = botInfo.username;
        _this3.context.botInfo = botInfo;

        if (!config.webhook) {
          var _ref = config.polling || {},
              timeout = _ref.timeout,
              limit = _ref.limit,
              allowedUpdates = _ref.allowedUpdates,
              stopCallback = _ref.stopCallback;

          return _this3.telegram.deleteWebhook().then(function () {
            return _this3.startPolling(timeout, limit, allowedUpdates, stopCallback);
          }).then(function () {
            return debug('Bot started with long-polling');
          });
        }

        if (typeof config.webhook.domain !== 'string' && typeof config.webhook.hookPath !== 'string') {
          throw new Error('Webhook domain or webhook path is required');
        }

        var domain = config.webhook.domain || '';

        if (domain.startsWith('https://') || domain.startsWith('http://')) {
          domain = new URL(domain).host;
        }

        var hookPath = config.webhook.hookPath || "/telegraf/".concat(crypto.randomBytes(32).toString('hex'));
        var _config$webhook = config.webhook,
            port = _config$webhook.port,
            host = _config$webhook.host,
            tlsOptions = _config$webhook.tlsOptions,
            cb = _config$webhook.cb;

        _this3.startWebhook(hookPath, tlsOptions, port, host, cb);

        if (!domain) {
          debug('Bot started with webhook');
          return;
        }

        return _this3.telegram.setWebhook("https://".concat(domain).concat(hookPath)).then(function () {
          return debug("Bot started with webhook @ https://".concat(domain));
        });
      })["catch"](function (err) {
        console.error('Launch failed');
        console.error(err.stack || err.toString());
      });
    }
  }, {
    key: "stop",
    value: function stop() {
      var _this4 = this;

      var cb = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : noop;
      debug('Stopping bot...');
      return new Promise(function (resolve) {
        var done = function done() {
          return resolve() & cb();
        };

        if (_this4.webhookServer) {
          return _this4.webhookServer.close(done);
        } else if (!_this4.polling.started) {
          return done();
        }

        _this4.polling.stopCallback = done;
        _this4.polling.started = false;
      });
    }
  }, {
    key: "handleUpdates",
    value: function handleUpdates(updates) {
      var _this5 = this;

      if (!Array.isArray(updates)) {
        return Promise.reject(new Error('Updates must be an array'));
      }

      var processAll = Promise.all(updates.map(function (update) {
        return _this5.handleUpdate(update);
      }));

      if (this.options.handlerTimeout === 0) {
        return processAll;
      }

      return Promise.race([processAll, new Promise(function (resolve) {
        return setTimeout(resolve, _this5.options.handlerTimeout);
      })]);
    }
  }, {
    key: "handleUpdate",
    value: function handleUpdate(update, webhookResponse) {
      var _this6 = this;

      debug('Processing update', update.update_id);
      var tg = new Telegram(this.token, this.telegram.options, webhookResponse);
      var TelegrafContext = this.options.contextType;
      var ctx = new TelegrafContext(update, tg, this.options);
      Object.assign(ctx, this.context);
      return this.middleware()(ctx)["catch"](function (err) {
        return _this6.handleError(err, ctx);
      });
    }
  }, {
    key: "fetchUpdates",
    value: function fetchUpdates() {
      var _this7 = this;

      if (!this.polling.started) {
        this.polling.stopCallback && this.polling.stopCallback();
        return;
      }

      var _this$polling = this.polling,
          timeout = _this$polling.timeout,
          limit = _this$polling.limit,
          offset = _this$polling.offset,
          allowedUpdates = _this$polling.allowedUpdates;
      this.telegram.getUpdates(timeout, limit, offset, allowedUpdates)["catch"](function (err) {
        if (err.code === 401 || err.code === 409) {
          throw err;
        }

        var wait = err.parameters && err.parameters.retry_after || _this7.options.retryAfter;
        console.error("Failed to fetch updates. Waiting: ".concat(wait, "s"), err.message);
        return new Promise(function (resolve) {
          return setTimeout(resolve, wait * 1000, []);
        });
      }).then(function (updates) {
        return _this7.polling.started ? _this7.handleUpdates(updates).then(function () {
          return updates;
        }) : [];
      })["catch"](function (err) {
        console.error('Failed to process updates.', err);
        _this7.polling.started = false;
        _this7.polling.offset = 0;
        _this7.polling.stopCallback && _this7.polling.stopCallback();
        return [];
      }).then(function (updates) {
        if (updates.length > 0) {
          _this7.polling.offset = updates[updates.length - 1].update_id + 1;
        }

        _this7.fetchUpdates();
      });
    }
  }, {
    key: "token",
    set: function set(token) {
      this.telegram = new Telegram(token, this.telegram ? this.telegram.options : this.options.telegram);
    },
    get: function get() {
      return this.telegram.token;
    }
  }, {
    key: "webhookReply",
    set: function set(webhookReply) {
      this.telegram.webhookReply = webhookReply;
    },
    get: function get() {
      return this.telegram.webhookReply;
    }
  }]);

  return Telegraf;
}(Composer);

module.exports = Object.assign(Telegraf, {
  Context: Context,
  Composer: Composer,
  "default": Telegraf,
  Extra: Extra,
  Markup: Markup,
  Router: Router,
  Telegraf: Telegraf,
  Telegram: Telegram,
  Stage: Stage,
  BaseScene: BaseScene,
  session: session
});