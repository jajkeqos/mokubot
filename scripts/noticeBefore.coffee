cronJob = require('cron').CronJob

module.exports = (robot) ->
  cronjob = new cronJob(
      cronTime: "0 30 20 * * 0"
      start:    true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#mokumoku"}, "もくもく会30分前だよ〜"
      )
