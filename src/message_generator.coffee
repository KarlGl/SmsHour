_ = require('lodash')
module.exports = (env)->
  if (env.messages.length > 0)
    env.messages[Math.round(Math.random() * (env.messages.length - 1))].text
  else
    ''
