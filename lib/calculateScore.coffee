pin = require('./linchpin')

pin.on 'calculateScore', (score) ->
  # Do some calculations with score
  pin.emit 'setScore', score: score
