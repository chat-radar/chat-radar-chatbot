# Description
#   Middleware for normalizing Xmpp adapter data.

class XmppMiddleware

  robot: null

  constructor: (@robot) ->
    # ignore if not Xmpp
    return unless @robot.adapter.constructor.name == 'XmppBot'

    @robot.responseMiddleware @handleMsg.bind(@)

  handleMsg: (context, next, done) ->
    # coffeelint: disable=max_line_length
    if context.strings.filter((string) -> string.match /^Карта чата: /).length > 0
      origType = context.response.envelope.user.type.slice 0
      context.response.envelope.user.type = 'chat'

      process.nextTick () ->
        context.response.envelope.user.type = origType
        context.response.reply 'Ответил в привате'
    # coffeelint: enable=max_line_length

    next()

module.exports = (robot) ->
  new XmppMiddleware robot
