"use strict";

function _createForOfIteratorHelper(o, allowArrayLike) { var it; if (typeof Symbol === "undefined" || o[Symbol.iterator] == null) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = o[Symbol.iterator](); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread(); }

function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }

function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }

function _iterableToArray(iter) { if (typeof Symbol !== "undefined" && Symbol.iterator in Object(iter)) return Array.from(iter); }

function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) return _arrayLikeToArray(arr); }

function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) { arr2[i] = arr[i]; } return arr2; }

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var Markup = /*#__PURE__*/function () {
  function Markup() {
    _classCallCheck(this, Markup);
  }

  _createClass(Markup, [{
    key: "forceReply",
    value: function forceReply() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.force_reply = value;
      return this;
    }
  }, {
    key: "removeKeyboard",
    value: function removeKeyboard() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.remove_keyboard = value;
      return this;
    }
  }, {
    key: "selective",
    value: function selective() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.selective = value;
      return this;
    }
  }, {
    key: "extra",
    value: function extra(options) {
      return _objectSpread({
        reply_markup: _objectSpread({}, this)
      }, options);
    }
  }, {
    key: "keyboard",
    value: function keyboard(buttons, options) {
      var keyboard = buildKeyboard(buttons, _objectSpread({
        columns: 1
      }, options));

      if (keyboard && keyboard.length > 0) {
        this.keyboard = keyboard;
      }

      return this;
    }
  }, {
    key: "resize",
    value: function resize() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.resize_keyboard = value;
      return this;
    }
  }, {
    key: "oneTime",
    value: function oneTime() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.one_time_keyboard = value;
      return this;
    }
  }, {
    key: "inlineKeyboard",
    value: function inlineKeyboard(buttons, options) {
      var keyboard = buildKeyboard(buttons, _objectSpread({
        columns: buttons.length
      }, options));

      if (keyboard && keyboard.length > 0) {
        this.inline_keyboard = keyboard;
      }

      return this;
    }
  }, {
    key: "button",
    value: function button(text, hide) {
      return Markup.button(text, hide);
    }
  }, {
    key: "contactRequestButton",
    value: function contactRequestButton(text, hide) {
      return Markup.contactRequestButton(text, hide);
    }
  }, {
    key: "locationRequestButton",
    value: function locationRequestButton(text, hide) {
      return Markup.locationRequestButton(text, hide);
    }
  }, {
    key: "urlButton",
    value: function urlButton(text, url, hide) {
      return Markup.urlButton(text, url, hide);
    }
  }, {
    key: "callbackButton",
    value: function callbackButton(text, data, hide) {
      return Markup.callbackButton(text, data, hide);
    }
  }, {
    key: "switchToChatButton",
    value: function switchToChatButton(text, value, hide) {
      return Markup.switchToChatButton(text, value, hide);
    }
  }, {
    key: "switchToCurrentChatButton",
    value: function switchToCurrentChatButton(text, value, hide) {
      return Markup.switchToCurrentChatButton(text, value, hide);
    }
  }, {
    key: "gameButton",
    value: function gameButton(text, hide) {
      return Markup.gameButton(text, hide);
    }
  }, {
    key: "payButton",
    value: function payButton(text, hide) {
      return Markup.payButton(text, hide);
    }
  }, {
    key: "loginButton",
    value: function loginButton(text, url, opts, hide) {
      return Markup.loginButton(text, url, opts, hide);
    }
  }], [{
    key: "removeKeyboard",
    value: function removeKeyboard(value) {
      return new Markup().removeKeyboard(value);
    }
  }, {
    key: "forceReply",
    value: function forceReply(value) {
      return new Markup().forceReply(value);
    }
  }, {
    key: "keyboard",
    value: function keyboard(buttons, options) {
      return new Markup().keyboard(buttons, options);
    }
  }, {
    key: "inlineKeyboard",
    value: function inlineKeyboard(buttons, options) {
      return new Markup().inlineKeyboard(buttons, options);
    }
  }, {
    key: "resize",
    value: function resize() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      return new Markup().resize(value);
    }
  }, {
    key: "selective",
    value: function selective() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      return new Markup().selective(value);
    }
  }, {
    key: "oneTime",
    value: function oneTime() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      return new Markup().oneTime(value);
    }
  }, {
    key: "button",
    value: function button(text) {
      var hide = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      return {
        text: text,
        hide: hide
      };
    }
  }, {
    key: "contactRequestButton",
    value: function contactRequestButton(text) {
      var hide = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      return {
        text: text,
        request_contact: true,
        hide: hide
      };
    }
  }, {
    key: "locationRequestButton",
    value: function locationRequestButton(text) {
      var hide = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      return {
        text: text,
        request_location: true,
        hide: hide
      };
    }
  }, {
    key: "pollRequestButton",
    value: function pollRequestButton(text, type) {
      var hide = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
      return {
        text: text,
        request_poll: {
          type: type
        },
        hide: hide
      };
    }
  }, {
    key: "urlButton",
    value: function urlButton(text, url) {
      var hide = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
      return {
        text: text,
        url: url,
        hide: hide
      };
    }
  }, {
    key: "callbackButton",
    value: function callbackButton(text, data) {
      var hide = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
      return {
        text: text,
        callback_data: data,
        hide: hide
      };
    }
  }, {
    key: "switchToChatButton",
    value: function switchToChatButton(text, value) {
      var hide = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
      return {
        text: text,
        switch_inline_query: value,
        hide: hide
      };
    }
  }, {
    key: "switchToCurrentChatButton",
    value: function switchToCurrentChatButton(text, value) {
      var hide = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;
      return {
        text: text,
        switch_inline_query_current_chat: value,
        hide: hide
      };
    }
  }, {
    key: "gameButton",
    value: function gameButton(text) {
      var hide = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      return {
        text: text,
        callback_game: {},
        hide: hide
      };
    }
  }, {
    key: "payButton",
    value: function payButton(text) {
      var hide = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      return {
        text: text,
        pay: true,
        hide: hide
      };
    }
  }, {
    key: "loginButton",
    value: function loginButton(text, url) {
      var opts = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : {};
      var hide = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : false;
      return {
        text: text,
        login_url: _objectSpread(_objectSpread({}, opts), {}, {
          url: url
        }),
        hide: hide
      };
    }
  }, {
    key: "formatHTML",
    value: function formatHTML() {
      var text = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';
      var entities = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : [];

      var chars = _toConsumableArray(text);

      var available = _toConsumableArray(entities);

      var opened = [];
      var result = [];

      var _loop = function _loop(offset) {
        while (true) {
          var index = available.findIndex(function (entity) {
            return entity.offset === offset;
          });

          if (index === -1) {
            break;
          }

          var entity = available[index];

          switch (entity.type) {
            case 'bold':
              result.push('<b>');
              break;

            case 'italic':
              result.push('<i>');
              break;

            case 'code':
              result.push('<code>');
              break;

            case 'pre':
              if (entity.language) {
                result.push("<pre><code class=\"language-".concat(entity.language, "\">"));
              } else {
                result.push('<pre>');
              }

              break;

            case 'strikethrough':
              result.push('<s>');
              break;

            case 'underline':
              result.push('<u>');
              break;

            case 'text_mention':
              result.push("<a href=\"tg://user?id=".concat(entity.user.id, "\">"));
              break;

            case 'text_link':
              result.push("<a href=\"".concat(entity.url, "\">"));
              break;
          }

          opened.unshift(entity);
          available.splice(index, 1);
        }

        result.push(chars[offset]);

        while (true) {
          var _index = opened.findIndex(function (entity) {
            return entity.offset + entity.length - 1 === offset;
          });

          if (_index === -1) {
            break;
          }

          var _entity = opened[_index];

          switch (_entity.type) {
            case 'bold':
              result.push('</b>');
              break;

            case 'italic':
              result.push('</i>');
              break;

            case 'code':
              result.push('</code>');
              break;

            case 'pre':
              if (_entity.language) {
                result.push('</code></pre>');
              } else {
                result.push('</pre>');
              }

              break;

            case 'strikethrough':
              result.push('</s>');
              break;

            case 'underline':
              result.push('</u>');
              break;

            case 'text_mention':
            case 'text_link':
              result.push('</a>');
              break;
          }

          opened.splice(_index, 1);
        }
      };

      for (var offset = 0; offset < chars.length; offset++) {
        _loop(offset);
      }

      return result.join('');
    }
  }]);

  return Markup;
}();

function buildKeyboard(buttons, options) {
  var result = [];

  if (!Array.isArray(buttons)) {
    return result;
  }

  if (buttons.find(Array.isArray)) {
    return buttons.map(function (row) {
      return row.filter(function (button) {
        return !button.hide;
      });
    });
  }

  var wrapFn = options.wrap ? options.wrap : function (btn, index, currentRow) {
    return currentRow.length >= options.columns;
  };
  var currentRow = [];
  var index = 0;

  var _iterator = _createForOfIteratorHelper(buttons.filter(function (button) {
    return !button.hide;
  })),
      _step;

  try {
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var btn = _step.value;

      if (wrapFn(btn, index, currentRow) && currentRow.length > 0) {
        result.push(currentRow);
        currentRow = [];
      }

      currentRow.push(btn);
      index++;
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }

  if (currentRow.length > 0) {
    result.push(currentRow);
  }

  return result;
}

module.exports = Markup;