cronJob = require('cron').CronJob

module.exports = (robot) ->
  text = "もくもく会はじまるよ〜！"

  cronjob = new cronJob(
      cronTime: "0 0 21 * * 0"
      start:    true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#mokumoku"}, text
      )
