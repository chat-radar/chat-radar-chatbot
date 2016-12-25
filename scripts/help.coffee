# Description:
#   Cправка по использованию Hubot.
#
# Commands:
#   hubot справка - Cправка по использованию
#
# Configuration:
#   PUBLIC_URI

class Help

  constructor: (robot) ->
    @robot = robot

    @robot.respond /(справка|помощь|команды|help)/i, @handleHelp

  getCommands: () ->
    return @robot.commands.map (command) =>
      return command
        .replace /hubot/ig, @robot.name
        .replace /--/, '-'
        .replace /\.$/, ''

  handleHelp: (msg) =>
    msg.send @getCommands().join('\n')

module.exports = (robot) ->
  new Help robot
