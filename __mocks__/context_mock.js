const Context = require('telegraf/context');
const Telegram = require('telegraf/core/network/client');

/**
 * Create a mocking TelegrafContext object for unit testing
 * scene.
 *
 * @param {Object} update
 *   The mocked update object. Supposed to be sent by server.
 * @param {*} contextExtra
 *   Any extra attributes to the resulting context.
 * @returns {TelegrafContext}
 *   The mocked telegraf context for unit testing.
 */
function makeMockContext(update = {}, contextExtra = {}) {
  const tg = new Telegram('', {});
  tg.callApi = (method, data) => {
    console.log(`mocked tg callApi ${method}`, data);
  };

  const ctx = new Context(update, tg, {});
  Object.assign(
    ctx,
    {
      session: {},
      debug: {
        currentScene: '',
        replies: [],
        replyMessages: () => ctx.debug.replies.map(({ message }) => message),
      },
    },
    contextExtra,
  );
  ctx.reply = (message, extra = undefined) => {
    ctx.debug.replies.push({ message, extra });
  };
  ctx.scene = {
    enter: (sceneName) => {
      ctx.debug.currentScene = sceneName;
      return false;
    },
    leave: () => {
      ctx.debug.currentScene = '';
      return false;
    },
  };
  ctx.wizard = {
      back: jest.fn(),
      next: () => true,
      leave: () => false
  }

  return ctx;
}

module.exports = {
  makeMockContext,
};