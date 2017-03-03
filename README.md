# Chat Radar Chatbot
> Group chat geotagging

Chat bot for Chat Radar built on the [Hubot](https://hubot.github.com/) framework.

![Chat Radar Chatbot interaction screenshot](https://share.roland.black/file/black-roland-share/7e6c8728-001d-11e7-a146-54271e687f63/Выделение-158.png
)

## Features

* Support of Jabber, Telegram, IRC and Discord
* Registering of your location
* Displaying cities for all chat participants

## Running Chat Radar Chatbot locally

You can test your hubot by running the following, however some plugins will not behave as expected unless the environment variables they rely upon have been set.

You can start Chat Radar locally by running:

    % bin/chat-radar-chatbot

You'll see some start up output and a prompt:

    [Sat Feb 28 2015 12:38:27 GMT+0000 (GMT)] INFO Using default redis on localhost:6379
    Chat Radar>

Then you can interact with Chat Radar by typing `Chat Radar help`.

    Chat Radar> Chat Radar help
    Chat Radar animate me <query> - The same thing as `image me`, except adds [snip]
    Chat Radar help - Displays all of the help commands that Chat Radar knows about.
    ...

## Licensing

The code in this project is licensed under MIT license.
