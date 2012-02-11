pin = require('./linchpin')

pin.on 'calculateScore', (score) ->
  console.log score
  # Do some calculations with score
  pin.emit 'setScore', score: score
