# Description:
#   atnd からイベントを返す
#
# Configuration:
#
# Commands:
#   hubot atnd <query> - atnd から <query> で検索したイベントを返す
#
# Author:
#   jajkeqos

module.exports = (robot) ->

  robot.respond /atnd( (.*))?/i, (msg) ->
    query = msg.match[2]
    if query
      getImage msg, 'http://api.atnd.org/events/?keyword=', query
    else
      msg.reply "クエリを指定してね！"

  getImage = (msg, url, query)->
    url = url + query + "&format=json&count=3"
    http = msg.http url
    http.get() (err, res, body) ->
      if res.statusCode is 404
        msg.send "イベントがないみたいです…"
      else if res.statusCode isnt 200
        msg.send "どうやらエラーみたいです…"
      else
        events = JSON.parse body
        times = (Number) events.results_returned
        events = events.events

        if times isnt 0
          for i in [0..times-1]
           event = events[i]
           title = event.event.title
           eventUrl = event.event.event_url
           msg.send title + " " + eventUrl
        else
          msg.send "イベントが見つからないみたいです…"
