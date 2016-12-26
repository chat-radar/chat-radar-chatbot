# Description:
#   Показывает информацию о Hubot.
#
# Commands:
#   hubot инфо - Информация о Hubot
#
# Configuration:
#   PUBLIC_URI

class Info

  # coffeelint: disable=max_line_length
  @info:    """
            Привет, я бот Hubot. С помощью Hubot ты можешь отметить свое местоположение и найти друзей поблизости.
            Для просмотра всех команд напиши `hubot справка`, а карту чата можно найти здесь: #{process.env.PUBLIC_URI}/
            """

  @unknown: """
            Неизвестная команда. Напиши `hubot справка` для просмотра всех команд, `hubot инфо` — информация о Hubot.
            """
  # coffeelint: enable=max_line_length

  constructor: (robot) ->
    @robot = robot

    @robot.respond /(инфо|info)/i, @handleHelp
    @robot.catchAll @handleUnknown

  handleHelp: (msg) =>
    msg.send Info.info.replace /hubot/ig, @robot.name

  handleUnknown: (msg) =>
    return unless msg.message.text.match ///^@?#{@robot.name} .*$///i

    msg.send Info.unknown.replace /hubot/ig, @robot.name

module.exports = (robot) ->
  new Info robot
