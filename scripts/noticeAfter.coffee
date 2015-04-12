cronJob = require('cron').CronJob

module.exports = (robot) ->
  nextDate = new Date()
  nextDate.setDate(nextDay.getDate() + Number(7))

  month = nextDate.getMonth() + 1
  date = nextDate.getDate()


  # TODO: 第n回の n をbrainを使って自動化する

  text = """
  次回の第2回もくもく会は#{month}月#{date}日21-23時開催予定です！

  ではみなさんの進捗発表どうぞ！！
  """

  cronjob = new cronJob(
      cronTime: "0 0 23 * * 0"
      start:    true
      timeZone: "Asia/Tokyo"
      onTick: ->
        robot.send {room: "#mokumoku"}, "もくもく会終了です〜！"
      )

  cronjob2 = new cronJob(
    cronTime: "10 0 23 * * 0"
    start:    true
    timeZone: "Asia/Tokyo"
    onTick: ->
      robot.send {room: "#mokumoku"}, text
  )
