# Description:
#   giphy から画像を返す
#
# Configuration:
#
# Commands:
#   hubot gif <query> - giphy から <query> で検索した画像を返す
#
# Author:
#   jajkeqos

module.exports = (robot) ->

  robot.respond /gif( (.*))?/i, (msg) ->
    query = msg.match[2]
    if query
      getImage msg, 'http://api.giphy.com/v1/gifs/search?q=', query
    else
      msg.reply "クエリを指定してね！"

  getImage = (msg, url, query)->
    url = url + query + "&api_key=dc6zaTOxFJmzC&limit=1"
    http = msg.http url
    http.get() (err, res, body) ->
      if res.statusCode is 404
        msg.send "画像がないみたいです…"
      else if res.statusCode isnt 200
        msg.send "どうやらエラーみたいです…"
      else
        images = JSON.parse body
        image = images.data[0]

        if image isnt undefined
         msg.send image.url
        else
          msg.send "画像が見つからないみたいです…"

