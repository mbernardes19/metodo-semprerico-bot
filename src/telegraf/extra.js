"use strict";

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var Markup = require('./markup');

var Extra = /*#__PURE__*/function () {
  function Extra(opts) {
    _classCallCheck(this, Extra);

    this.load(opts);
  }

  _createClass(Extra, [{
    key: "load",
    value: function load() {
      var opts = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : {};
      return Object.assign(this, opts);
    }
  }, {
    key: "inReplyTo",
    value: function inReplyTo(messageId) {
      this.reply_to_message_id = messageId;
      return this;
    }
  }, {
    key: "notifications",
    value: function notifications() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.disable_notification = !value;
      return this;
    }
  }, {
    key: "webPreview",
    value: function webPreview() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.disable_web_page_preview = !value;
      return this;
    }
  }, {
    key: "markup",
    value: function markup(_markup) {
      if (typeof _markup === 'function') {
        _markup = _markup(new Markup());
      }

      this.reply_markup = _objectSpread({}, _markup);
      return this;
    }
  }, {
    key: "HTML",
    value: function HTML() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.parse_mode = value ? 'HTML' : undefined;
      return this;
    }
  }, {
    key: "markdown",
    value: function markdown() {
      var value = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : true;
      this.parse_mode = value ? 'Markdown' : undefined;
      return this;
    }
  }, {
    key: "caption",
    value: function caption() {
      var _caption = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';

      this.caption = _caption;
      return this;
    }
  }], [{
    key: "inReplyTo",
    value: function inReplyTo(messageId) {
      return new Extra().inReplyTo(messageId);
    }
  }, {
    key: "notifications",
    value: function notifications(value) {
      return new Extra().notifications(value);
    }
  }, {
    key: "webPreview",
    value: function webPreview(value) {
      return new Extra().webPreview(value);
    }
  }, {
    key: "load",
    value: function load(opts) {
      return new Extra(opts);
    }
  }, {
    key: "markup",
    value: function markup(_markup2) {
      return new Extra().markup(_markup2);
    }
  }, {
    key: "HTML",
    value: function HTML(value) {
      return new Extra().HTML(value);
    }
  }, {
    key: "markdown",
    value: function markdown(value) {
      return new Extra().markdown(value);
    }
  }, {
    key: "caption",
    value: function caption(_caption2) {
      return new Extra().caption(_caption2);
    }
  }]);

  return Extra;
}();

Extra.Markup = Markup;
module.exports = Extra;