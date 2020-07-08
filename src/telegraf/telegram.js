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

var replicators = require('./core/replicators');

var ApiClient = require('./core/network/client');

var Telegram = /*#__PURE__*/function (_ApiClient) {
  _inherits(Telegram, _ApiClient);

  var _super = _createSuper(Telegram);

  function Telegram() {
    _classCallCheck(this, Telegram);

    return _super.apply(this, arguments);
  }

  _createClass(Telegram, [{
    key: "getMe",
    value: function getMe() {
      return this.callApi('getMe');
    }
  }, {
    key: "getFile",
    value: function getFile(fileId) {
      return this.callApi('getFile', {
        file_id: fileId
      });
    }
  }, {
    key: "getFileLink",
    value: function getFileLink(fileId) {
      var _this = this;

      return Promise.resolve(fileId).then(function (fileId) {
        if (fileId && fileId.file_path) {
          return fileId;
        }

        var id = fileId && fileId.file_id ? fileId.file_id : fileId;
        return _this.getFile(id);
      }).then(function (file) {
        return "".concat(_this.options.apiRoot, "/file/bot").concat(_this.token, "/").concat(file.file_path);
      });
    }
  }, {
    key: "getUpdates",
    value: function getUpdates(timeout, limit, offset, allowedUpdates) {
      var url = "getUpdates?offset=".concat(offset, "&limit=").concat(limit, "&timeout=").concat(timeout);
      return this.callApi(url, {
        allowed_updates: allowedUpdates
      });
    }
  }, {
    key: "getWebhookInfo",
    value: function getWebhookInfo() {
      return this.callApi('getWebhookInfo');
    }
  }, {
    key: "getGameHighScores",
    value: function getGameHighScores(userId, inlineMessageId, chatId, messageId) {
      return this.callApi('getGameHighScores', {
        user_id: userId,
        inline_message_id: inlineMessageId,
        chat_id: chatId,
        message_id: messageId
      });
    }
  }, {
    key: "setGameScore",
    value: function setGameScore(userId, score, inlineMessageId, chatId, messageId) {
      var editMessage = arguments.length > 5 && arguments[5] !== undefined ? arguments[5] : true;
      var force = arguments.length > 6 ? arguments[6] : undefined;
      return this.callApi('setGameScore', {
        force: force,
        score: score,
        user_id: userId,
        inline_message_id: inlineMessageId,
        chat_id: chatId,
        message_id: messageId,
        disable_edit_message: !editMessage
      });
    }
  }, {
    key: "setWebhook",
    value: function setWebhook(url, certificate, maxConnections, allowedUpdates) {
      return this.callApi('setWebhook', {
        url: url,
        certificate: certificate,
        max_connections: maxConnections,
        allowed_updates: allowedUpdates
      });
    }
  }, {
    key: "deleteWebhook",
    value: function deleteWebhook() {
      return this.callApi('deleteWebhook');
    }
  }, {
    key: "sendMessage",
    value: function sendMessage(chatId, text, extra) {
      return this.callApi('sendMessage', _objectSpread({
        chat_id: chatId,
        text: text
      }, extra));
    }
  }, {
    key: "forwardMessage",
    value: function forwardMessage(chatId, fromChatId, messageId, extra) {
      return this.callApi('forwardMessage', _objectSpread({
        chat_id: chatId,
        from_chat_id: fromChatId,
        message_id: messageId
      }, extra));
    }
  }, {
    key: "sendChatAction",
    value: function sendChatAction(chatId, action) {
      return this.callApi('sendChatAction', {
        chat_id: chatId,
        action: action
      });
    }
  }, {
    key: "getUserProfilePhotos",
    value: function getUserProfilePhotos(userId, offset, limit) {
      return this.callApi('getUserProfilePhotos', {
        user_id: userId,
        offset: offset,
        limit: limit
      });
    }
  }, {
    key: "sendLocation",
    value: function sendLocation(chatId, latitude, longitude, extra) {
      return this.callApi('sendLocation', _objectSpread({
        chat_id: chatId,
        latitude: latitude,
        longitude: longitude
      }, extra));
    }
  }, {
    key: "sendVenue",
    value: function sendVenue(chatId, latitude, longitude, title, address, extra) {
      return this.callApi('sendVenue', _objectSpread({
        latitude: latitude,
        longitude: longitude,
        title: title,
        address: address,
        chat_id: chatId
      }, extra));
    }
  }, {
    key: "sendInvoice",
    value: function sendInvoice(chatId, invoice, extra) {
      return this.callApi('sendInvoice', _objectSpread(_objectSpread({
        chat_id: chatId
      }, invoice), extra));
    }
  }, {
    key: "sendContact",
    value: function sendContact(chatId, phoneNumber, firstName, extra) {
      return this.callApi('sendContact', _objectSpread({
        chat_id: chatId,
        phone_number: phoneNumber,
        first_name: firstName
      }, extra));
    }
  }, {
    key: "sendPhoto",
    value: function sendPhoto(chatId, photo, extra) {
      return this.callApi('sendPhoto', _objectSpread({
        chat_id: chatId,
        photo: photo
      }, extra));
    }
  }, {
    key: "sendDice",
    value: function sendDice(chatId, extra) {
      return this.callApi('sendDice', _objectSpread({
        chat_id: chatId
      }, extra));
    }
  }, {
    key: "sendDocument",
    value: function sendDocument(chatId, document, extra) {
      return this.callApi('sendDocument', _objectSpread({
        chat_id: chatId,
        document: document
      }, extra));
    }
  }, {
    key: "sendAudio",
    value: function sendAudio(chatId, audio, extra) {
      return this.callApi('sendAudio', _objectSpread({
        chat_id: chatId,
        audio: audio
      }, extra));
    }
  }, {
    key: "sendSticker",
    value: function sendSticker(chatId, sticker, extra) {
      return this.callApi('sendSticker', _objectSpread({
        chat_id: chatId,
        sticker: sticker
      }, extra));
    }
  }, {
    key: "sendVideo",
    value: function sendVideo(chatId, video, extra) {
      return this.callApi('sendVideo', _objectSpread({
        chat_id: chatId,
        video: video
      }, extra));
    }
  }, {
    key: "sendAnimation",
    value: function sendAnimation(chatId, animation, extra) {
      return this.callApi('sendAnimation', _objectSpread({
        chat_id: chatId,
        animation: animation
      }, extra));
    }
  }, {
    key: "sendVideoNote",
    value: function sendVideoNote(chatId, videoNote, extra) {
      return this.callApi('sendVideoNote', _objectSpread({
        chat_id: chatId,
        video_note: videoNote
      }, extra));
    }
  }, {
    key: "sendVoice",
    value: function sendVoice(chatId, voice, extra) {
      return this.callApi('sendVoice', _objectSpread({
        chat_id: chatId,
        voice: voice
      }, extra));
    }
  }, {
    key: "sendGame",
    value: function sendGame(chatId, gameName, extra) {
      return this.callApi('sendGame', _objectSpread({
        chat_id: chatId,
        game_short_name: gameName
      }, extra));
    }
  }, {
    key: "sendMediaGroup",
    value: function sendMediaGroup(chatId, media, extra) {
      return this.callApi('sendMediaGroup', _objectSpread({
        chat_id: chatId,
        media: media
      }, extra));
    }
  }, {
    key: "sendPoll",
    value: function sendPoll(chatId, question, options, extra) {
      return this.callApi('sendPoll', _objectSpread({
        chat_id: chatId,
        type: 'regular',
        question: question,
        options: options
      }, extra));
    }
  }, {
    key: "sendQuiz",
    value: function sendQuiz(chatId, question, options, extra) {
      return this.callApi('sendPoll', _objectSpread({
        chat_id: chatId,
        type: 'quiz',
        question: question,
        options: options
      }, extra));
    }
  }, {
    key: "stopPoll",
    value: function stopPoll(chatId, messageId, extra) {
      return this.callApi('stopPoll', _objectSpread({
        chat_id: chatId,
        message_id: messageId
      }, extra));
    }
  }, {
    key: "getChat",
    value: function getChat(chatId) {
      return this.callApi('getChat', {
        chat_id: chatId
      });
    }
  }, {
    key: "getChatAdministrators",
    value: function getChatAdministrators(chatId) {
      return this.callApi('getChatAdministrators', {
        chat_id: chatId
      });
    }
  }, {
    key: "getChatMember",
    value: function getChatMember(chatId, userId) {
      return this.callApi('getChatMember', {
        chat_id: chatId,
        user_id: userId
      });
    }
  }, {
    key: "getChatMembersCount",
    value: function getChatMembersCount(chatId) {
      return this.callApi('getChatMembersCount', {
        chat_id: chatId
      });
    }
  }, {
    key: "answerInlineQuery",
    value: function answerInlineQuery(inlineQueryId, results, extra) {
      return this.callApi('answerInlineQuery', _objectSpread({
        inline_query_id: inlineQueryId,
        results: results
      }, extra));
    }
  }, {
    key: "setChatPermissions",
    value: function setChatPermissions(chatId, permissions) {
      return this.callApi('setChatPermissions', {
        chat_id: chatId,
        permissions: permissions
      });
    }
  }, {
    key: "kickChatMember",
    value: function kickChatMember(chatId, userId, untilDate) {
      return this.callApi('kickChatMember', {
        chat_id: chatId,
        user_id: userId,
        until_date: untilDate
      });
    }
  }, {
    key: "promoteChatMember",
    value: function promoteChatMember(chatId, userId, extra) {
      return this.callApi('promoteChatMember', _objectSpread({
        chat_id: chatId,
        user_id: userId
      }, extra));
    }
  }, {
    key: "restrictChatMember",
    value: function restrictChatMember(chatId, userId, extra) {
      return this.callApi('restrictChatMember', _objectSpread({
        chat_id: chatId,
        user_id: userId
      }, extra));
    }
  }, {
    key: "setChatAdministratorCustomTitle",
    value: function setChatAdministratorCustomTitle(chatId, userId, title) {
      return this.callApi('setChatAdministratorCustomTitle', {
        chat_id: chatId,
        user_id: userId,
        custom_title: title
      });
    }
  }, {
    key: "exportChatInviteLink",
    value: function exportChatInviteLink(chatId) {
      return this.callApi('exportChatInviteLink', {
        chat_id: chatId
      });
    }
  }, {
    key: "setChatPhoto",
    value: function setChatPhoto(chatId, photo) {
      return this.callApi('setChatPhoto', {
        chat_id: chatId,
        photo: photo
      });
    }
  }, {
    key: "deleteChatPhoto",
    value: function deleteChatPhoto(chatId) {
      return this.callApi('deleteChatPhoto', {
        chat_id: chatId
      });
    }
  }, {
    key: "setChatTitle",
    value: function setChatTitle(chatId, title) {
      return this.callApi('setChatTitle', {
        chat_id: chatId,
        title: title
      });
    }
  }, {
    key: "setChatDescription",
    value: function setChatDescription(chatId, description) {
      return this.callApi('setChatDescription', {
        chat_id: chatId,
        description: description
      });
    }
  }, {
    key: "pinChatMessage",
    value: function pinChatMessage(chatId, messageId, extra) {
      return this.callApi('pinChatMessage', _objectSpread({
        chat_id: chatId,
        message_id: messageId
      }, extra));
    }
  }, {
    key: "unpinChatMessage",
    value: function unpinChatMessage(chatId) {
      return this.callApi('unpinChatMessage', {
        chat_id: chatId
      });
    }
  }, {
    key: "leaveChat",
    value: function leaveChat(chatId) {
      return this.callApi('leaveChat', {
        chat_id: chatId
      });
    }
  }, {
    key: "unbanChatMember",
    value: function unbanChatMember(chatId, userId) {
      return this.callApi('unbanChatMember', {
        chat_id: chatId,
        user_id: userId
      });
    }
  }, {
    key: "answerCbQuery",
    value: function answerCbQuery(callbackQueryId, text, showAlert, extra) {
      return this.callApi('answerCallbackQuery', _objectSpread({
        text: text,
        show_alert: showAlert,
        callback_query_id: callbackQueryId
      }, extra));
    }
  }, {
    key: "answerGameQuery",
    value: function answerGameQuery(callbackQueryId, url) {
      return this.callApi('answerCallbackQuery', {
        url: url,
        callback_query_id: callbackQueryId
      });
    }
  }, {
    key: "answerShippingQuery",
    value: function answerShippingQuery(shippingQueryId, ok, shippingOptions, errorMessage) {
      return this.callApi('answerShippingQuery', {
        ok: ok,
        shipping_query_id: shippingQueryId,
        shipping_options: shippingOptions,
        error_message: errorMessage
      });
    }
  }, {
    key: "answerPreCheckoutQuery",
    value: function answerPreCheckoutQuery(preCheckoutQueryId, ok, errorMessage) {
      return this.callApi('answerPreCheckoutQuery', {
        ok: ok,
        pre_checkout_query_id: preCheckoutQueryId,
        error_message: errorMessage
      });
    }
  }, {
    key: "editMessageText",
    value: function editMessageText(chatId, messageId, inlineMessageId, text, extra) {
      return this.callApi('editMessageText', _objectSpread({
        text: text,
        chat_id: chatId,
        message_id: messageId,
        inline_message_id: inlineMessageId
      }, extra));
    }
  }, {
    key: "editMessageCaption",
    value: function editMessageCaption(chatId, messageId, inlineMessageId, caption) {
      var extra = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : {};
      return this.callApi('editMessageCaption', {
        caption: caption,
        chat_id: chatId,
        message_id: messageId,
        inline_message_id: inlineMessageId,
        parse_mode: extra.parse_mode,
        reply_markup: extra.parse_mode || extra.reply_markup ? extra.reply_markup : extra
      });
    }
  }, {
    key: "editMessageMedia",
    value: function editMessageMedia(chatId, messageId, inlineMessageId, media) {
      var extra = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : {};
      return this.callApi('editMessageMedia', {
        chat_id: chatId,
        message_id: messageId,
        inline_message_id: inlineMessageId,
        media: _objectSpread(_objectSpread({}, media), {}, {
          parse_mode: extra.parse_mode
        }),
        reply_markup: extra.reply_markup ? extra.reply_markup : extra
      });
    }
  }, {
    key: "editMessageReplyMarkup",
    value: function editMessageReplyMarkup(chatId, messageId, inlineMessageId, markup) {
      return this.callApi('editMessageReplyMarkup', {
        chat_id: chatId,
        message_id: messageId,
        inline_message_id: inlineMessageId,
        reply_markup: markup
      });
    }
  }, {
    key: "editMessageLiveLocation",
    value: function editMessageLiveLocation(latitude, longitude, chatId, messageId, inlineMessageId, markup) {
      return this.callApi('editMessageLiveLocation', {
        latitude: latitude,
        longitude: longitude,
        chat_id: chatId,
        message_id: messageId,
        inline_message_id: inlineMessageId,
        reply_markup: markup
      });
    }
  }, {
    key: "stopMessageLiveLocation",
    value: function stopMessageLiveLocation(chatId, messageId, inlineMessageId, markup) {
      return this.callApi('stopMessageLiveLocation', {
        chat_id: chatId,
        message_id: messageId,
        inline_message_id: inlineMessageId,
        reply_markup: markup
      });
    }
  }, {
    key: "deleteMessage",
    value: function deleteMessage(chatId, messageId) {
      return this.callApi('deleteMessage', {
        chat_id: chatId,
        message_id: messageId
      });
    }
  }, {
    key: "setChatStickerSet",
    value: function setChatStickerSet(chatId, setName) {
      return this.callApi('setChatStickerSet', {
        chat_id: chatId,
        sticker_set_name: setName
      });
    }
  }, {
    key: "deleteChatStickerSet",
    value: function deleteChatStickerSet(chatId) {
      return this.callApi('deleteChatStickerSet', {
        chat_id: chatId
      });
    }
  }, {
    key: "getStickerSet",
    value: function getStickerSet(name) {
      return this.callApi('getStickerSet', {
        name: name
      });
    }
  }, {
    key: "uploadStickerFile",
    value: function uploadStickerFile(ownerId, stickerFile) {
      return this.callApi('uploadStickerFile', {
        user_id: ownerId,
        png_sticker: stickerFile
      });
    }
  }, {
    key: "createNewStickerSet",
    value: function createNewStickerSet(ownerId, name, title, stickerData) {
      return this.callApi('createNewStickerSet', _objectSpread({
        name: name,
        title: title,
        user_id: ownerId
      }, stickerData));
    }
  }, {
    key: "addStickerToSet",
    value: function addStickerToSet(ownerId, name, stickerData, isMasks) {
      return this.callApi('addStickerToSet', _objectSpread({
        name: name,
        user_id: ownerId,
        is_masks: isMasks
      }, stickerData));
    }
  }, {
    key: "setStickerPositionInSet",
    value: function setStickerPositionInSet(sticker, position) {
      return this.callApi('setStickerPositionInSet', {
        sticker: sticker,
        position: position
      });
    }
  }, {
    key: "setStickerSetThumb",
    value: function setStickerSetThumb(name, userId, thumb) {
      return this.callApi('setStickerSetThumb', {
        name: name,
        user_id: userId,
        thumb: thumb
      });
    }
  }, {
    key: "deleteStickerFromSet",
    value: function deleteStickerFromSet(sticker) {
      return this.callApi('deleteStickerFromSet', {
        sticker: sticker
      });
    }
  }, {
    key: "getMyCommands",
    value: function getMyCommands() {
      return this.callApi('getMyCommands');
    }
  }, {
    key: "setMyCommands",
    value: function setMyCommands(commands) {
      return this.callApi('setMyCommands', {
        commands: commands
      });
    }
  }, {
    key: "setPassportDataErrors",
    value: function setPassportDataErrors(userId, errors) {
      return this.callApi('setPassportDataErrors', {
        user_id: userId,
        errors: errors
      });
    }
  }, {
    key: "sendCopy",
    value: function sendCopy(chatId, message, extra) {
      if (!message) {
        throw new Error('Message is required');
      }

      var type = Object.keys(replicators.copyMethods).find(function (type) {
        return message[type];
      });

      if (!type) {
        throw new Error('Unsupported message type');
      }

      var opts = _objectSpread(_objectSpread({
        chat_id: chatId
      }, replicators[type](message)), extra);

      return this.callApi(replicators.copyMethods[type], opts);
    }
  }]);

  return Telegram;
}(ApiClient);

module.exports = Telegram;