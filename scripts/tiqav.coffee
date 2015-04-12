# Description:
#   tiqav から画像を返す
#
# Configuration:
#   HUBOT_TIQAV_404_MESSAGE - 画像がなかった場合のメッセージ
#   HUBOT_TIQAV_ERROR_MESSAGE - エラーが発生した場合のメッセージ
#
# Commands:
#   hubot tiqav - tiqav から画像をランダムで返す
#   hubot tiqav <query> - tiqav から <query> で検索した画像を返す
#
# Author:
#   moqada

module.exports = (robot) ->
  random = (start, end) ->
    start + Math.floor(Math.random()*(end - start + 1))

  robot.respond /tiqav( (.*))?/i, (msg) ->
    query = msg.match[2]
    if query
      imageMe msg, 'http://api.tiqav.com/search.json', {q: query}
    else
      imageMe msg, 'http://api.tiqav.com/search/random.json'

  imageMe = (msg, url, query)->
    http = msg.http url
    if query
      http = http.query query
    http.get() (err, res, body) ->
      if res.statusCode is 404
        msg.send process.env.HUBOT_TIQAV_404_MESSAGE or "画像がないみたいです…"
      else if res.statusCode isnt 200
        msg.send process.env.HUBOT_TIQAV_ERROR_MESSAGE or "どうやらエラーみたいです…"
      else
        images = JSON.parse body
        image =  images[random(0,2)]
        msg.send "http://img.tiqav.com/#{image.id}.#{image.ext}"
