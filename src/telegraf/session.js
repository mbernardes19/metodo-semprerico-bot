"use strict";

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

module.exports = function (opts) {
  var options = _objectSpread({
    property: 'session',
    store: new Map(),
    getSessionKey: function getSessionKey(ctx) {
      return ctx.from && ctx.chat && "".concat(ctx.from.id, ":").concat(ctx.chat.id);
    }
  }, opts);

  var ttlMs = options.ttl && options.ttl * 1000;
  return function (ctx, next) {
    var key = options.getSessionKey(ctx);

    if (!key) {
      return next(ctx);
    }

    var now = Date.now();
    return Promise.resolve(options.store.get(key)).then(function (state) {
      return state || {
        session: {}
      };
    }).then(function (_ref) {
      var session = _ref.session,
          expires = _ref.expires;

      if (expires && expires < now) {
        session = {};
      }

      Object.defineProperty(ctx, options.property, {
        get: function get() {
          return session;
        },
        set: function set(newValue) {
          session = _objectSpread({}, newValue);
        }
      });
      return next(ctx).then(function () {
        return options.store.set(key, {
          session: session,
          expires: ttlMs ? now + ttlMs : null
        });
      });
    });
  };
};