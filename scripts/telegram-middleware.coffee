# Description
#   Middleware for normalizing Telegram adapter data.

class TelegramMiddleware

  robot: null

  constructor: (@robot) ->
    # ignore if not Telegram
    return unless @robot.adapter.constructor.name == 'Telegram'

    @robot.receiveMiddleware @handleMsg.bind(@)

  handleMsg: (context, next, done) ->
    user = context.response.envelope.user

    fullName = []
    fullName.push user.first_name if user.first_name
    fullName.push user.last_name if user.last_name

    if fullName.length > 0
      context.response.envelope.user.name = fullName.join ' '

    next()

module.exports = (robot) ->
  new TelegramMiddleware robot
