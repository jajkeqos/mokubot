cronJob = require('cron').CronJob

module.exports = (robot) ->
  # TODO: 第n回を 自動で挿入する
  text = '''
第5回 もくもく会 21-23時

途中参加（抜け）OK
1.Slackにログインする
2.各自、今日やることを宣言する
3.もくもく作業する（約2時間（適当））
4.終了時間が近づく
5.今日やったことを発表（ただ書く）する
6.解散する
'''

  cronjob = new cronJob(
    cronTime: "10 0 21 * * 0"
    start:    true
    timeZone: "Asia/Tokyo"
    onTick: ->
      robot.send {room: "#mokumoku"}, text
  )
