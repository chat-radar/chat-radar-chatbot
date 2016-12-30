# Description
#   Middleware for normalizing Discord adapter data.

class DiscordMiddleware

  robot: null

  constructor: (@robot) ->
    # ignore if not Discord
    return unless @robot.adapter.constructor.name == 'DiscordBot'

    @robot.receiveMiddleware @handleMsg.bind(@)

  handleMsg: (context, next, done) ->
    # coffeelint: disable=max_line_length
    if context.response.message.text
      text = context.response.message.text.replace new RegExp("^@#{@robot.name}#[0-9]+", 'i'), @robot.name
      context.response.message.text = text
    # coffeelint: enable=max_line_length

    next()

module.exports = (robot) ->
  new DiscordMiddleware robot
