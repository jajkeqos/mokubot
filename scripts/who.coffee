# Description
#   適当な呼びかけに反応します
#
# Dependencies:
#   Nothing
#
# Commands:
#   mokubot /(hi|hello|やっほ|ヤッホ)/- なにかしらを返す
#
# Notes:
#   Nothing
#
# Author:
#   jajkeqos

module.exports = (robot) ->

  robot.respond /(hi|hello|やっほ|ヤッホ)/i, (msg) ->
    reply = [
      "やっほ〜！",
      "おつかれ〜！",
      "もくもく…",
      "あべしッ"
    ]
    msg.reply msg.random reply


