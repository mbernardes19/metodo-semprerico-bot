"use strict";

function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); if (enumerableOnly) symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; }); keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i] != null ? arguments[i] : {}; if (i % 2) { ownKeys(Object(source), true).forEach(function (key) { _defineProperty(target, key, source[key]); }); } else if (Object.getOwnPropertyDescriptors) { Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)); } else { ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }

var UpdateTypes = ['callback_query', 'channel_post', 'chosen_inline_result', 'edited_channel_post', 'edited_message', 'inline_query', 'shipping_query', 'pre_checkout_query', 'message', 'poll', 'poll_answer'];
var MessageSubTypes = ['voice', 'video_note', 'video', 'animation', 'venue', 'text', 'supergroup_chat_created', 'successful_payment', 'sticker', 'pinned_message', 'photo', 'new_chat_title', 'new_chat_photo', 'new_chat_members', 'migrate_to_chat_id', 'migrate_from_chat_id', 'location', 'left_chat_member', 'invoice', 'group_chat_created', 'game', 'dice', 'document', 'delete_chat_photo', 'contact', 'channel_chat_created', 'audio', 'connected_website', 'passport_data', 'poll', 'forward_date'];
var MessageSubTypesMapping = {
  forward_date: 'forward'
};

var TelegrafContext = /*#__PURE__*/function () {
  function TelegrafContext(update, telegram, options) {
    var _this = this;

    _classCallCheck(this, TelegrafContext);

    this.tg = telegram;
    this.update = update;
    this.options = options;
    this.updateType = UpdateTypes.find(function (key) {
      return key in _this.update;
    });

    if (this.updateType === 'message' || this.options.channelMode && this.updateType === 'channel_post') {
      this.updateSubTypes = MessageSubTypes.filter(function (key) {
        return key in _this.update[_this.updateType];
      }).map(function (type) {
        return MessageSubTypesMapping[type] || type;
      });
    } else {
      this.updateSubTypes = [];
    }

    Object.getOwnPropertyNames(TelegrafContext.prototype).filter(function (key) {
      return key !== 'constructor' && typeof _this[key] === 'function';
    }).forEach(function (key) {
      return _this[key] = _this[key].bind(_this);
    });
  }

  _createClass(TelegrafContext, [{
    key: "assert",
    value: function assert(value, method) {
      if (!value) {
        throw new Error("Telegraf: \"".concat(method, "\" isn't available for \"").concat(this.updateType, "::").concat(this.updateSubTypes, "\""));
      }
    }
  }, {
    key: "answerInlineQuery",
    value: function answerInlineQuery() {
      var _this$telegram;

      this.assert(this.inlineQuery, 'answerInlineQuery');

      for (var _len = arguments.length, args = new Array(_len), _key = 0; _key < _len; _key++) {
        args[_key] = arguments[_key];
      }

      return (_this$telegram = this.telegram).answerInlineQuery.apply(_this$telegram, [this.inlineQuery.id].concat(args));
    }
  }, {
    key: "answerCbQuery",
    value: function answerCbQuery() {
      var _this$telegram2;

      this.assert(this.callbackQuery, 'answerCbQuery');

      for (var _len2 = arguments.length, args = new Array(_len2), _key2 = 0; _key2 < _len2; _key2++) {
        args[_key2] = arguments[_key2];
      }

      return (_this$telegram2 = this.telegram).answerCbQuery.apply(_this$telegram2, [this.callbackQuery.id].concat(args));
    }
  }, {
    key: "answerGameQuery",
    value: function answerGameQuery() {
      var _this$telegram3;

      this.assert(this.callbackQuery, 'answerGameQuery');

      for (var _len3 = arguments.length, args = new Array(_len3), _key3 = 0; _key3 < _len3; _key3++) {
        args[_key3] = arguments[_key3];
      }

      return (_this$telegram3 = this.telegram).answerGameQuery.apply(_this$telegram3, [this.callbackQuery.id].concat(args));
    }
  }, {
    key: "answerShippingQuery",
    value: function answerShippingQuery() {
      var _this$telegram4;

      this.assert(this.shippingQuery, 'answerShippingQuery');

      for (var _len4 = arguments.length, args = new Array(_len4), _key4 = 0; _key4 < _len4; _key4++) {
        args[_key4] = arguments[_key4];
      }

      return (_this$telegram4 = this.telegram).answerShippingQuery.apply(_this$telegram4, [this.shippingQuery.id].concat(args));
    }
  }, {
    key: "answerPreCheckoutQuery",
    value: function answerPreCheckoutQuery() {
      var _this$telegram5;

      this.assert(this.preCheckoutQuery, 'answerPreCheckoutQuery');

      for (var _len5 = arguments.length, args = new Array(_len5), _key5 = 0; _key5 < _len5; _key5++) {
        args[_key5] = arguments[_key5];
      }

      return (_this$telegram5 = this.telegram).answerPreCheckoutQuery.apply(_this$telegram5, [this.preCheckoutQuery.id].concat(args));
    }
  }, {
    key: "editMessageText",
    value: function editMessageText(text, extra) {
      this.assert(this.callbackQuery || this.inlineMessageId, 'editMessageText');
      return this.inlineMessageId ? this.telegram.editMessageText(undefined, undefined, this.inlineMessageId, text, extra) : this.telegram.editMessageText(this.chat.id, this.callbackQuery.message.message_id, undefined, text, extra);
    }
  }, {
    key: "editMessageCaption",
    value: function editMessageCaption(caption, extra) {
      this.assert(this.callbackQuery || this.inlineMessageId, 'editMessageCaption');
      return this.inlineMessageId ? this.telegram.editMessageCaption(undefined, undefined, this.inlineMessageId, caption, extra) : this.telegram.editMessageCaption(this.chat.id, this.callbackQuery.message.message_id, undefined, caption, extra);
    }
  }, {
    key: "editMessageMedia",
    value: function editMessageMedia(media, extra) {
      this.assert(this.callbackQuery || this.inlineMessageId, 'editMessageMedia');
      return this.inlineMessageId ? this.telegram.editMessageMedia(undefined, undefined, this.inlineMessageId, media, extra) : this.telegram.editMessageMedia(this.chat.id, this.callbackQuery.message.message_id, undefined, media, extra);
    }
  }, {
    key: "editMessageReplyMarkup",
    value: function editMessageReplyMarkup(markup) {
      this.assert(this.callbackQuery || this.inlineMessageId, 'editMessageReplyMarkup');
      return this.inlineMessageId ? this.telegram.editMessageReplyMarkup(undefined, undefined, this.inlineMessageId, markup) : this.telegram.editMessageReplyMarkup(this.chat.id, this.callbackQuery.message.message_id, undefined, markup);
    }
  }, {
    key: "editMessageLiveLocation",
    value: function editMessageLiveLocation(latitude, longitude, markup) {
      this.assert(this.callbackQuery || this.inlineMessageId, 'editMessageLiveLocation');
      return this.inlineMessageId ? this.telegram.editMessageLiveLocation(latitude, longitude, undefined, undefined, this.inlineMessageId, markup) : this.telegram.editMessageLiveLocation(latitude, longitude, this.chat.id, this.callbackQuery.message.message_id, undefined, markup);
    }
  }, {
    key: "stopMessageLiveLocation",
    value: function stopMessageLiveLocation(markup) {
      this.assert(this.callbackQuery || this.inlineMessageId, 'stopMessageLiveLocation');
      return this.inlineMessageId ? this.telegram.stopMessageLiveLocation(undefined, undefined, this.inlineMessageId, markup) : this.telegram.stopMessageLiveLocation(this.chat.id, this.callbackQuery.message.message_id, undefined, markup);
    }
  }, {
    key: "reply",
    value: function reply() {
      var _this$telegram6;

      this.assert(this.chat, 'reply');

      for (var _len6 = arguments.length, args = new Array(_len6), _key6 = 0; _key6 < _len6; _key6++) {
        args[_key6] = arguments[_key6];
      }

      return (_this$telegram6 = this.telegram).sendMessage.apply(_this$telegram6, [this.chat.id].concat(args));
    }
  }, {
    key: "getChat",
    value: function getChat() {
      var _this$telegram7;

      this.assert(this.chat, 'getChat');

      for (var _len7 = arguments.length, args = new Array(_len7), _key7 = 0; _key7 < _len7; _key7++) {
        args[_key7] = arguments[_key7];
      }

      return (_this$telegram7 = this.telegram).getChat.apply(_this$telegram7, [this.chat.id].concat(args));
    }
  }, {
    key: "exportChatInviteLink",
    value: function exportChatInviteLink() {
      var _this$telegram8;

      this.assert(this.chat, 'exportChatInviteLink');

      for (var _len8 = arguments.length, args = new Array(_len8), _key8 = 0; _key8 < _len8; _key8++) {
        args[_key8] = arguments[_key8];
      }

      return (_this$telegram8 = this.telegram).exportChatInviteLink.apply(_this$telegram8, [this.chat.id].concat(args));
    }
  }, {
    key: "kickChatMember",
    value: function kickChatMember() {
      var _this$telegram9;

      this.assert(this.chat, 'kickChatMember');

      for (var _len9 = arguments.length, args = new Array(_len9), _key9 = 0; _key9 < _len9; _key9++) {
        args[_key9] = arguments[_key9];
      }

      return (_this$telegram9 = this.telegram).kickChatMember.apply(_this$telegram9, [this.chat.id].concat(args));
    }
  }, {
    key: "unbanChatMember",
    value: function unbanChatMember() {
      var _this$telegram10;

      this.assert(this.chat, 'unbanChatMember');

      for (var _len10 = arguments.length, args = new Array(_len10), _key10 = 0; _key10 < _len10; _key10++) {
        args[_key10] = arguments[_key10];
      }

      return (_this$telegram10 = this.telegram).unbanChatMember.apply(_this$telegram10, [this.chat.id].concat(args));
    }
  }, {
    key: "restrictChatMember",
    value: function restrictChatMember() {
      var _this$telegram11;

      this.assert(this.chat, 'restrictChatMember');

      for (var _len11 = arguments.length, args = new Array(_len11), _key11 = 0; _key11 < _len11; _key11++) {
        args[_key11] = arguments[_key11];
      }

      return (_this$telegram11 = this.telegram).restrictChatMember.apply(_this$telegram11, [this.chat.id].concat(args));
    }
  }, {
    key: "promoteChatMember",
    value: function promoteChatMember() {
      var _this$telegram12;

      this.assert(this.chat, 'promoteChatMember');

      for (var _len12 = arguments.length, args = new Array(_len12), _key12 = 0; _key12 < _len12; _key12++) {
        args[_key12] = arguments[_key12];
      }

      return (_this$telegram12 = this.telegram).promoteChatMember.apply(_this$telegram12, [this.chat.id].concat(args));
    }
  }, {
    key: "setChatAdministratorCustomTitle",
    value: function setChatAdministratorCustomTitle() {
      var _this$telegram13;

      this.assert(this.chat, 'setChatAdministratorCustomTitle');

      for (var _len13 = arguments.length, args = new Array(_len13), _key13 = 0; _key13 < _len13; _key13++) {
        args[_key13] = arguments[_key13];
      }

      return (_this$telegram13 = this.telegram).setChatAdministratorCustomTitle.apply(_this$telegram13, [this.chat.id].concat(args));
    }
  }, {
    key: "setChatPhoto",
    value: function setChatPhoto() {
      var _this$telegram14;

      this.assert(this.chat, 'setChatPhoto');

      for (var _len14 = arguments.length, args = new Array(_len14), _key14 = 0; _key14 < _len14; _key14++) {
        args[_key14] = arguments[_key14];
      }

      return (_this$telegram14 = this.telegram).setChatPhoto.apply(_this$telegram14, [this.chat.id].concat(args));
    }
  }, {
    key: "deleteChatPhoto",
    value: function deleteChatPhoto() {
      var _this$telegram15;

      this.assert(this.chat, 'deleteChatPhoto');

      for (var _len15 = arguments.length, args = new Array(_len15), _key15 = 0; _key15 < _len15; _key15++) {
        args[_key15] = arguments[_key15];
      }

      return (_this$telegram15 = this.telegram).deleteChatPhoto.apply(_this$telegram15, [this.chat.id].concat(args));
    }
  }, {
    key: "setChatTitle",
    value: function setChatTitle() {
      var _this$telegram16;

      this.assert(this.chat, 'setChatTitle');

      for (var _len16 = arguments.length, args = new Array(_len16), _key16 = 0; _key16 < _len16; _key16++) {
        args[_key16] = arguments[_key16];
      }

      return (_this$telegram16 = this.telegram).setChatTitle.apply(_this$telegram16, [this.chat.id].concat(args));
    }
  }, {
    key: "setChatDescription",
    value: function setChatDescription() {
      var _this$telegram17;

      this.assert(this.chat, 'setChatDescription');

      for (var _len17 = arguments.length, args = new Array(_len17), _key17 = 0; _key17 < _len17; _key17++) {
        args[_key17] = arguments[_key17];
      }

      return (_this$telegram17 = this.telegram).setChatDescription.apply(_this$telegram17, [this.chat.id].concat(args));
    }
  }, {
    key: "pinChatMessage",
    value: function pinChatMessage() {
      var _this$telegram18;

      this.assert(this.chat, 'pinChatMessage');

      for (var _len18 = arguments.length, args = new Array(_len18), _key18 = 0; _key18 < _len18; _key18++) {
        args[_key18] = arguments[_key18];
      }

      return (_this$telegram18 = this.telegram).pinChatMessage.apply(_this$telegram18, [this.chat.id].concat(args));
    }
  }, {
    key: "unpinChatMessage",
    value: function unpinChatMessage() {
      var _this$telegram19;

      this.assert(this.chat, 'unpinChatMessage');

      for (var _len19 = arguments.length, args = new Array(_len19), _key19 = 0; _key19 < _len19; _key19++) {
        args[_key19] = arguments[_key19];
      }

      return (_this$telegram19 = this.telegram).unpinChatMessage.apply(_this$telegram19, [this.chat.id].concat(args));
    }
  }, {
    key: "leaveChat",
    value: function leaveChat() {
      var _this$telegram20;

      this.assert(this.chat, 'leaveChat');

      for (var _len20 = arguments.length, args = new Array(_len20), _key20 = 0; _key20 < _len20; _key20++) {
        args[_key20] = arguments[_key20];
      }

      return (_this$telegram20 = this.telegram).leaveChat.apply(_this$telegram20, [this.chat.id].concat(args));
    }
  }, {
    key: "setChatPermissions",
    value: function setChatPermissions() {
      var _this$telegram21;

      this.assert(this.chat, 'setChatPermissions');

      for (var _len21 = arguments.length, args = new Array(_len21), _key21 = 0; _key21 < _len21; _key21++) {
        args[_key21] = arguments[_key21];
      }

      return (_this$telegram21 = this.telegram).setChatPermissions.apply(_this$telegram21, [this.chat.id].concat(args));
    }
  }, {
    key: "getChatAdministrators",
    value: function getChatAdministrators() {
      var _this$telegram22;

      this.assert(this.chat, 'getChatAdministrators');

      for (var _len22 = arguments.length, args = new Array(_len22), _key22 = 0; _key22 < _len22; _key22++) {
        args[_key22] = arguments[_key22];
      }

      return (_this$telegram22 = this.telegram).getChatAdministrators.apply(_this$telegram22, [this.chat.id].concat(args));
    }
  }, {
    key: "getChatMember",
    value: function getChatMember() {
      var _this$telegram23;

      this.assert(this.chat, 'getChatMember');

      for (var _len23 = arguments.length, args = new Array(_len23), _key23 = 0; _key23 < _len23; _key23++) {
        args[_key23] = arguments[_key23];
      }

      return (_this$telegram23 = this.telegram).getChatMember.apply(_this$telegram23, [this.chat.id].concat(args));
    }
  }, {
    key: "getChatMembersCount",
    value: function getChatMembersCount() {
      var _this$telegram24;

      this.assert(this.chat, 'getChatMembersCount');

      for (var _len24 = arguments.length, args = new Array(_len24), _key24 = 0; _key24 < _len24; _key24++) {
        args[_key24] = arguments[_key24];
      }

      return (_this$telegram24 = this.telegram).getChatMembersCount.apply(_this$telegram24, [this.chat.id].concat(args));
    }
  }, {
    key: "setPassportDataErrors",
    value: function setPassportDataErrors(errors) {
      this.assert(this.chat, 'setPassportDataErrors');
      return this.telegram.setPassportDataErrors(this.from.id, errors);
    }
  }, {
    key: "replyWithPhoto",
    value: function replyWithPhoto() {
      var _this$telegram25;

      this.assert(this.chat, 'replyWithPhoto');

      for (var _len25 = arguments.length, args = new Array(_len25), _key25 = 0; _key25 < _len25; _key25++) {
        args[_key25] = arguments[_key25];
      }

      return (_this$telegram25 = this.telegram).sendPhoto.apply(_this$telegram25, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithMediaGroup",
    value: function replyWithMediaGroup() {
      var _this$telegram26;

      this.assert(this.chat, 'replyWithMediaGroup');

      for (var _len26 = arguments.length, args = new Array(_len26), _key26 = 0; _key26 < _len26; _key26++) {
        args[_key26] = arguments[_key26];
      }

      return (_this$telegram26 = this.telegram).sendMediaGroup.apply(_this$telegram26, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithAudio",
    value: function replyWithAudio() {
      var _this$telegram27;

      this.assert(this.chat, 'replyWithAudio');

      for (var _len27 = arguments.length, args = new Array(_len27), _key27 = 0; _key27 < _len27; _key27++) {
        args[_key27] = arguments[_key27];
      }

      return (_this$telegram27 = this.telegram).sendAudio.apply(_this$telegram27, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithDice",
    value: function replyWithDice() {
      var _this$telegram28;

      this.assert(this.chat, 'replyWithDice');

      for (var _len28 = arguments.length, args = new Array(_len28), _key28 = 0; _key28 < _len28; _key28++) {
        args[_key28] = arguments[_key28];
      }

      return (_this$telegram28 = this.telegram).sendDice.apply(_this$telegram28, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithDocument",
    value: function replyWithDocument() {
      var _this$telegram29;

      this.assert(this.chat, 'replyWithDocument');

      for (var _len29 = arguments.length, args = new Array(_len29), _key29 = 0; _key29 < _len29; _key29++) {
        args[_key29] = arguments[_key29];
      }

      return (_this$telegram29 = this.telegram).sendDocument.apply(_this$telegram29, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithSticker",
    value: function replyWithSticker() {
      var _this$telegram30;

      this.assert(this.chat, 'replyWithSticker');

      for (var _len30 = arguments.length, args = new Array(_len30), _key30 = 0; _key30 < _len30; _key30++) {
        args[_key30] = arguments[_key30];
      }

      return (_this$telegram30 = this.telegram).sendSticker.apply(_this$telegram30, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithVideo",
    value: function replyWithVideo() {
      var _this$telegram31;

      this.assert(this.chat, 'replyWithVideo');

      for (var _len31 = arguments.length, args = new Array(_len31), _key31 = 0; _key31 < _len31; _key31++) {
        args[_key31] = arguments[_key31];
      }

      return (_this$telegram31 = this.telegram).sendVideo.apply(_this$telegram31, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithAnimation",
    value: function replyWithAnimation() {
      var _this$telegram32;

      this.assert(this.chat, 'replyWithAnimation');

      for (var _len32 = arguments.length, args = new Array(_len32), _key32 = 0; _key32 < _len32; _key32++) {
        args[_key32] = arguments[_key32];
      }

      return (_this$telegram32 = this.telegram).sendAnimation.apply(_this$telegram32, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithVideoNote",
    value: function replyWithVideoNote() {
      var _this$telegram33;

      this.assert(this.chat, 'replyWithVideoNote');

      for (var _len33 = arguments.length, args = new Array(_len33), _key33 = 0; _key33 < _len33; _key33++) {
        args[_key33] = arguments[_key33];
      }

      return (_this$telegram33 = this.telegram).sendVideoNote.apply(_this$telegram33, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithInvoice",
    value: function replyWithInvoice() {
      var _this$telegram34;

      this.assert(this.chat, 'replyWithInvoice');

      for (var _len34 = arguments.length, args = new Array(_len34), _key34 = 0; _key34 < _len34; _key34++) {
        args[_key34] = arguments[_key34];
      }

      return (_this$telegram34 = this.telegram).sendInvoice.apply(_this$telegram34, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithGame",
    value: function replyWithGame() {
      var _this$telegram35;

      this.assert(this.chat, 'replyWithGame');

      for (var _len35 = arguments.length, args = new Array(_len35), _key35 = 0; _key35 < _len35; _key35++) {
        args[_key35] = arguments[_key35];
      }

      return (_this$telegram35 = this.telegram).sendGame.apply(_this$telegram35, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithVoice",
    value: function replyWithVoice() {
      var _this$telegram36;

      this.assert(this.chat, 'replyWithVoice');

      for (var _len36 = arguments.length, args = new Array(_len36), _key36 = 0; _key36 < _len36; _key36++) {
        args[_key36] = arguments[_key36];
      }

      return (_this$telegram36 = this.telegram).sendVoice.apply(_this$telegram36, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithPoll",
    value: function replyWithPoll() {
      var _this$telegram37;

      this.assert(this.chat, 'replyWithPoll');

      for (var _len37 = arguments.length, args = new Array(_len37), _key37 = 0; _key37 < _len37; _key37++) {
        args[_key37] = arguments[_key37];
      }

      return (_this$telegram37 = this.telegram).sendPoll.apply(_this$telegram37, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithQuiz",
    value: function replyWithQuiz() {
      var _this$telegram38;

      this.assert(this.chat, 'replyWithQuiz');

      for (var _len38 = arguments.length, args = new Array(_len38), _key38 = 0; _key38 < _len38; _key38++) {
        args[_key38] = arguments[_key38];
      }

      return (_this$telegram38 = this.telegram).sendQuiz.apply(_this$telegram38, [this.chat.id].concat(args));
    }
  }, {
    key: "stopPoll",
    value: function stopPoll() {
      var _this$telegram39;

      this.assert(this.chat, 'stopPoll');

      for (var _len39 = arguments.length, args = new Array(_len39), _key39 = 0; _key39 < _len39; _key39++) {
        args[_key39] = arguments[_key39];
      }

      return (_this$telegram39 = this.telegram).stopPoll.apply(_this$telegram39, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithChatAction",
    value: function replyWithChatAction() {
      var _this$telegram40;

      this.assert(this.chat, 'replyWithChatAction');

      for (var _len40 = arguments.length, args = new Array(_len40), _key40 = 0; _key40 < _len40; _key40++) {
        args[_key40] = arguments[_key40];
      }

      return (_this$telegram40 = this.telegram).sendChatAction.apply(_this$telegram40, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithLocation",
    value: function replyWithLocation() {
      var _this$telegram41;

      this.assert(this.chat, 'replyWithLocation');

      for (var _len41 = arguments.length, args = new Array(_len41), _key41 = 0; _key41 < _len41; _key41++) {
        args[_key41] = arguments[_key41];
      }

      return (_this$telegram41 = this.telegram).sendLocation.apply(_this$telegram41, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithVenue",
    value: function replyWithVenue() {
      var _this$telegram42;

      this.assert(this.chat, 'replyWithVenue');

      for (var _len42 = arguments.length, args = new Array(_len42), _key42 = 0; _key42 < _len42; _key42++) {
        args[_key42] = arguments[_key42];
      }

      return (_this$telegram42 = this.telegram).sendVenue.apply(_this$telegram42, [this.chat.id].concat(args));
    }
  }, {
    key: "replyWithContact",
    value: function replyWithContact() {
      var _this$telegram43;

      this.assert(this.from, 'replyWithContact');

      for (var _len43 = arguments.length, args = new Array(_len43), _key43 = 0; _key43 < _len43; _key43++) {
        args[_key43] = arguments[_key43];
      }

      return (_this$telegram43 = this.telegram).sendContact.apply(_this$telegram43, [this.chat.id].concat(args));
    }
  }, {
    key: "getStickerSet",
    value: function getStickerSet(setName) {
      return this.telegram.getStickerSet(setName);
    }
  }, {
    key: "setChatStickerSet",
    value: function setChatStickerSet(setName) {
      this.assert(this.chat, 'setChatStickerSet');
      return this.telegram.setChatStickerSet(this.chat.id, setName);
    }
  }, {
    key: "deleteChatStickerSet",
    value: function deleteChatStickerSet() {
      this.assert(this.chat, 'deleteChatStickerSet');
      return this.telegram.deleteChatStickerSet(this.chat.id);
    }
  }, {
    key: "setStickerPositionInSet",
    value: function setStickerPositionInSet(sticker, position) {
      return this.telegram.setStickerPositionInSet(sticker, position);
    }
  }, {
    key: "setStickerSetThumb",
    value: function setStickerSetThumb() {
      var _this$telegram44;

      return (_this$telegram44 = this.telegram).setStickerSetThumb.apply(_this$telegram44, arguments);
    }
  }, {
    key: "deleteStickerFromSet",
    value: function deleteStickerFromSet(sticker) {
      return this.telegram.deleteStickerFromSet(sticker);
    }
  }, {
    key: "uploadStickerFile",
    value: function uploadStickerFile() {
      var _this$telegram45;

      this.assert(this.from, 'uploadStickerFile');

      for (var _len44 = arguments.length, args = new Array(_len44), _key44 = 0; _key44 < _len44; _key44++) {
        args[_key44] = arguments[_key44];
      }

      return (_this$telegram45 = this.telegram).uploadStickerFile.apply(_this$telegram45, [this.from.id].concat(args));
    }
  }, {
    key: "createNewStickerSet",
    value: function createNewStickerSet() {
      var _this$telegram46;

      this.assert(this.from, 'createNewStickerSet');

      for (var _len45 = arguments.length, args = new Array(_len45), _key45 = 0; _key45 < _len45; _key45++) {
        args[_key45] = arguments[_key45];
      }

      return (_this$telegram46 = this.telegram).createNewStickerSet.apply(_this$telegram46, [this.from.id].concat(args));
    }
  }, {
    key: "addStickerToSet",
    value: function addStickerToSet() {
      var _this$telegram47;

      this.assert(this.from, 'addStickerToSet');

      for (var _len46 = arguments.length, args = new Array(_len46), _key46 = 0; _key46 < _len46; _key46++) {
        args[_key46] = arguments[_key46];
      }

      return (_this$telegram47 = this.telegram).addStickerToSet.apply(_this$telegram47, [this.from.id].concat(args));
    }
  }, {
    key: "getMyCommands",
    value: function getMyCommands() {
      return this.telegram.getMyCommands();
    }
  }, {
    key: "setMyCommands",
    value: function setMyCommands() {
      var _this$telegram48;

      return (_this$telegram48 = this.telegram).setMyCommands.apply(_this$telegram48, arguments);
    }
  }, {
    key: "replyWithMarkdown",
    value: function replyWithMarkdown(markdown, extra) {
      return this.reply(markdown, _objectSpread({
        parse_mode: 'Markdown'
      }, extra));
    }
  }, {
    key: "replyWithMarkdownV2",
    value: function replyWithMarkdownV2(markdown, extra) {
      return this.reply(markdown, _objectSpread({
        parse_mode: 'MarkdownV2'
      }, extra));
    }
  }, {
    key: "replyWithHTML",
    value: function replyWithHTML(html, extra) {
      return this.reply(html, _objectSpread({
        parse_mode: 'HTML'
      }, extra));
    }
  }, {
    key: "deleteMessage",
    value: function deleteMessage(messageId) {
      this.assert(this.chat, 'deleteMessage');

      if (typeof messageId !== 'undefined') {
        return this.telegram.deleteMessage(this.chat.id, messageId);
      }

      var message = this.message || this.editedMessage || this.channelPost || this.editedChannelPost || this.callbackQuery && this.callbackQuery.message;
      this.assert(message, 'deleteMessage');
      return this.telegram.deleteMessage(this.chat.id, message.message_id);
    }
  }, {
    key: "forwardMessage",
    value: function forwardMessage(chatId, extra) {
      this.assert(this.chat, 'forwardMessage');
      var message = this.message || this.editedMessage || this.channelPost || this.editedChannelPost || this.callbackQuery && this.callbackQuery.message;
      this.assert(message, 'forwardMessage');
      return this.telegram.forwardMessage(chatId, this.chat.id, message.message_id, extra);
    }
  }, {
    key: "me",
    get: function get() {
      return this.options && this.options.username;
    }
  }, {
    key: "telegram",
    get: function get() {
      return this.tg;
    }
  }, {
    key: "message",
    get: function get() {
      return this.update.message;
    }
  }, {
    key: "editedMessage",
    get: function get() {
      return this.update.edited_message;
    }
  }, {
    key: "inlineQuery",
    get: function get() {
      return this.update.inline_query;
    }
  }, {
    key: "shippingQuery",
    get: function get() {
      return this.update.shipping_query;
    }
  }, {
    key: "preCheckoutQuery",
    get: function get() {
      return this.update.pre_checkout_query;
    }
  }, {
    key: "chosenInlineResult",
    get: function get() {
      return this.update.chosen_inline_result;
    }
  }, {
    key: "channelPost",
    get: function get() {
      return this.update.channel_post;
    }
  }, {
    key: "editedChannelPost",
    get: function get() {
      return this.update.edited_channel_post;
    }
  }, {
    key: "callbackQuery",
    get: function get() {
      return this.update.callback_query;
    }
  }, {
    key: "poll",
    get: function get() {
      return this.update.poll;
    }
  }, {
    key: "pollAnswer",
    get: function get() {
      return this.update.poll_answer;
    }
  }, {
    key: "chat",
    get: function get() {
      return this.message && this.message.chat || this.editedMessage && this.editedMessage.chat || this.callbackQuery && this.callbackQuery.message && this.callbackQuery.message.chat || this.channelPost && this.channelPost.chat || this.editedChannelPost && this.editedChannelPost.chat;
    }
  }, {
    key: "from",
    get: function get() {
      return this.message && this.message.from || this.editedMessage && this.editedMessage.from || this.callbackQuery && this.callbackQuery.from || this.inlineQuery && this.inlineQuery.from || this.channelPost && this.channelPost.from || this.editedChannelPost && this.editedChannelPost.from || this.shippingQuery && this.shippingQuery.from || this.preCheckoutQuery && this.preCheckoutQuery.from || this.chosenInlineResult && this.chosenInlineResult.from;
    }
  }, {
    key: "inlineMessageId",
    get: function get() {
      return this.callbackQuery && this.callbackQuery.inline_message_id || this.chosenInlineResult && this.chosenInlineResult.inline_message_id;
    }
  }, {
    key: "passportData",
    get: function get() {
      return this.message && this.message.passport_data;
    }
  }, {
    key: "state",
    get: function get() {
      if (!this.contextState) {
        this.contextState = {};
      }

      return this.contextState;
    },
    set: function set(value) {
      this.contextState = _objectSpread({}, value);
    }
  }, {
    key: "webhookReply",
    get: function get() {
      return this.tg.webhookReply;
    },
    set: function set(enable) {
      this.tg.webhookReply = enable;
    }
  }]);

  return TelegrafContext;
}();

module.exports = TelegrafContext;