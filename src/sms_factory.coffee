messageGenerator = require('./message_generator')
module.exports = ->
  time: Date()
  message: messageGenerator()
