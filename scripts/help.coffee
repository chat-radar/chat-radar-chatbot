# Description:
#   Generates help commands for Hubot.
#
# Commands:
#   hubot справка - Cправка по использованию
#
# Configuration:
#   PUBLIC_URI

class Help

  # coffeelint: disable=max_line_length
  @description: """
                Привет, я бот Chat Radar. С помощью Chat Radar ты можешь отметить свое местоположение и найти друзей поблизости.
                Ниже список доступных команд, а посмотреть карту чата можно здесь: #{process.env.PUBLIC_URI}/
                """
  # coffeelint: enable=max_line_length

  constructor: (robot) ->
    @robot = robot

    @robot.respond /(справка|помощь|help)/i, @handleHelp
    #@robot.hear new RegExp(@robot.name, 'i'), @handleHelp

  getDescription: () ->
    return Help.description

  getCommands: () ->
    return @robot.commands.map (command) =>
      return command
        .replace /hubot/i, @robot.name
        .replace /--/, '-'
        .replace /\.$/, ''

  handleHelp: (msg) =>
    msg.send """
            #{@getDescription()}

            #{@getCommands().join('\n')}
             """

module.exports = (robot) ->
  new Help robot
