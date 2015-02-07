messageGenerator = require('./message_generator')
module.exports = (env)->
  time: Date()
  message: messageGenerator(env)
