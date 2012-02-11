pin = require('./linchpin')

pin.on 'setScore', (score) ->
  #save score to the database
  console.log score
  pin.emit 'score.end', score

