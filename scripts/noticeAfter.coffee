cronJob = require('cron').CronJob

module.exports = (robot) ->
  cronjob = new cronJob(
      cronTime: "0 0 23 * * 0"
      start:    true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#mokumoku"}, "もくもく会終了です〜！"
      )
