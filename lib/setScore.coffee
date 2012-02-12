pin = require('linchpin')

pin.once 'setScore', (score) ->
  #save score to the database
  console.log 'setScore'
  pin.emit 'score.end', score

