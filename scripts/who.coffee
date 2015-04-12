module.exports = (robot) ->

  robot.respond /(hi|hello|やっほ|ヤッホ)/i, (msg) ->
    reply = [
      "やっほ〜！",
      "おつかれ〜！",
      "もくもく…",
      "あべしッ"
    ]
    msg.reply msg.random reply


