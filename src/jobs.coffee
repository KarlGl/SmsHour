sms_sender = require('./sms_sender')
module.exports = (env, timer)->

  # there could be 2 kinds of timers, the waiter and the job. clear both.
  if timer
    if timer.wait
      clearTimeout timer.wait
    if timer.job
      clearInterval timer.job

  timer = {}

  msUntilNextHour = ->
    d = new Date()
    h = new Date(d.getFullYear(), d.getMonth(), d.getDate(), d.getHours() + 1, 0, 0, 0)
    # h = new Date(d.getFullYear(), d.getMonth(), d.getDate(), d.getHours(), d.getMinutes() + 1, 0, 0)
    h - d
  if env.settings.enabled=='t'
    # wait till the hour, then interval every hour
    timer.wait = setTimeout(->
      # once on the hour
      sms_sender()
      # then every hour after
      # timer.job = setInterval(sms_sender, 1000 * 60)
      timer.job = setInterval(sms_sender, 1000 * 60 * 60)
    , msUntilNextHour())
  timer
