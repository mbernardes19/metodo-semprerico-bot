const axios = require('axios').default;

const Reason = {
    ERROR: 'ERROR',
    INVALID_ACTION: 'INVALID_ACTION',
    USER_INTENT: 'USER_INTENT',
    SUCCESS: 'SUCCESS'
}

const endConversation = async ({ctx, isFinished, reason}) => {
    try {
        await axios.post('http://localhost:3030/bot', {chatId: ctx.chat.id, finished: isFinished, reason})
        await ctx.scene.leave();
    } catch (err) {
        console.log(err)
        await ctx.scene.leave();
    }
}

module.exports = {endConversation, Reason}