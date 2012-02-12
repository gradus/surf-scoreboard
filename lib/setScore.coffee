pin = require('./linchpin')

pin.once 'setScore', (score) ->
  #save score to the database
  pin.emit 'score.end', score

