pin = require('./linchpin')

pin.on 'setScore', (score) ->
  #save score to the database
  pin.emit 'score.end', score

