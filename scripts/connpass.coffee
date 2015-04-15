# Description:
#   connpass からイベントを返す
#
# Configuration:
#
# Commands:
#   hubot conpass <query> - conpass から <query> で検索したイベントを返す
#
# Author:
#   jajkeqos

module.exports = (robot) ->

  robot.respond /conpass( (.*))?/i, (msg) ->
    query = msg.match[2]
    if query
      getImage msg, 'http://connpass.com/api/v1/event/?keyword=', query
    else
      msg.reply "クエリを指定してね！"

  getImage = (msg, url, query)->
    url = url + query + "&count=5"
    http = msg.http url
    http.get() (err, res, body) ->
      if res.statusCode is 404
        msg.send "イベントがないみたいです…"
      else if res.statusCode isnt 200
        msg.send "どうやらエラーみたいです…"
      else
        events = JSON.parse body
        times = (Number) events.results_returned
        console.log times
        events = events.events

        if times isnt 0
          for i in [0..times-1]
            event = events[i]
            title = event.title
            eventUrl = event.event_url
            msg.send title + " " + eventUrl
        else
          msg.send "イベントが見つからないみたいです…"
