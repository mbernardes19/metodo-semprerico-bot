"use strict";

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var debug = require('debug')('telegraf:scenes:context');

var _require = require('../composer'),
    safePassThru = _require.safePassThru;

var noop = function noop() {
  return Promise.resolve();
};

var now = function now() {
  return Math.floor(Date.now() / 1000);
};

var SceneContext = /*#__PURE__*/function () {
  function SceneContext(ctx, scenes, options) {
    _classCallCheck(this, SceneContext);

    this.ctx = ctx;
    this.scenes = scenes;
    this.options = options;
  }

  _createClass(SceneContext, [{
    key: "reset",
    value: function reset() {
      var sessionName = this.options.sessionName;
      delete this.ctx[sessionName].__scenes;
    }
  }, {
    key: "enter",
    value: function enter(sceneId, initialState, silent) {
      var _this = this;

      if (!sceneId || !this.scenes.has(sceneId)) {
        throw new Error("Can't find scene: ".concat(sceneId));
      }

      var leave = silent ? noop() : this.leave();
      return leave.then(function () {
        debug('Enter scene', sceneId, initialState, silent);
        _this.session.current = sceneId;
        _this.state = initialState;
        var ttl = _this.current.ttl || _this.options.ttl;

        if (ttl) {
          _this.session.expires = now() + ttl;
        }

        if (silent) {
          return Promise.resolve();
        }

        var handler = typeof _this.current.enterMiddleware === 'function' ? _this.current.enterMiddleware() : _this.current.middleware();
        return handler(_this.ctx, noop);
      });
    }
  }, {
    key: "reenter",
    value: function reenter() {
      return this.enter(this.session.current, this.state);
    }
  }, {
    key: "leave",
    value: function leave() {
      var _this2 = this;

      debug('Leave scene');
      var handler = this.current && this.current.leaveMiddleware ? this.current.leaveMiddleware() : safePassThru();
      return handler(this.ctx, noop).then(function () {
        return _this2.reset();
      });
    }
  }, {
    key: "session",
    get: function get() {
      var sessionName = this.options.sessionName;
      var session = this.ctx[sessionName].__scenes || {};

      if (session.expires < now()) {
        session = {};
      }

      this.ctx[sessionName].__scenes = session;
      return session;
    }
  }, {
    key: "state",
    get: function get() {
      this.session.state = this.session.state || {};
      return this.session.state;
    },
    set: function set(value) {
      this.session.state = _objectSpread({}, value);
    }
  }, {
    key: "current",
    get: function get() {
      var sceneId = this.session.current || this.options["default"];
      return sceneId && this.scenes.has(sceneId) ? this.scenes.get(sceneId) : null;
    }
  }]);

  return SceneContext;
}();

module.exports = SceneContext;