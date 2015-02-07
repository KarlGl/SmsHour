_ = require('lodash')
env = require('./env')
express = require('express')
app = module.exports = express()
jobs = require('./jobs')
app.use(require('connect-livereload')())
app.use(require('body-parser')())

timer = jobs(env)

app.post '/send_now', (req, res)->
  console.log("sending an sms now instead of waiting");
  timer = jobs(env, timer);
  res.send('Sent');

app.post '/settings', (req, res)->
  console.log("Updating server environment")
  console.log(req.body)
  _.each Object.keys(req.body), (key)->
    env.settings[key] = req.body[key]
  timer = jobs(env, timer)
  res.send(JSON.stringify(env.settings, null, 3))

# just clear messages always now
# app.post '/clear_messages', (req, res)->
#   console.log("clearing messages")
#   env.messages = []
#   res.send(env.messages)

app.post '/messages', (req, res)->
  console.log("Updating messages")
  console.log(req.body)
  env.messages = []
  _.each req.body, (message)->
    env.messages.push({text: message})
  timer = jobs(env, timer)
  res.send(env.messages)

# get csv of sms
app.get('/', (req, res)->
  console.log(req.params)
  res.send(
    _.reduce(
      env.smss, (rt, sms)->
        rt + sms.time + ",\"" + sms.message + "\"\n"
    , "Time,Message\n"
    )
  )
)

server = app.listen(3000, ->
  host = server.address().address
  port = server.address().port
  console.log('Example app listening at http://%s:%s', host, port)
)
