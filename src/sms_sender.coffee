smsFactory = require('./sms_factory')
request = require('request')
qs = require('querystring')

module.exports = (env)->
  sms = smsFactory(env)
  params = {
    username: env.settings.user
    password: env.settings.pass
    message: sms.message
    to: env.settings.to
    from: env.settings.from
  }

  # dont log the password... i guess
  # console.log("Sending text" + JSON.stringify(params, null, '\t'))
  console.log("Sending text" + JSON.stringify(sms, null, '\t'))
  request.get(env.settings.url + "?" + qs.stringify(params), (err, httpResponse, body)->
    if (err)
      console.log(err)
    console.log('served by: ' + httpResponse.headers.server)
    console.log("status: " + httpResponse.statusCode)
    if (httpResponse.statusCode == 200)
      console.log("Got 200")

      # omg this api is so shit, this is how you detect status codes basically

      code = body.split(':')[0]
      if (code == "OK")
        env.smss.push(sms)
        console.log("Sms sent and saved with :")
        console.log(sms.time + ",\"" + sms.message + "\"")
      else
        console.log("ERROR: Shit got fucked, cunt: " + body)
  )
