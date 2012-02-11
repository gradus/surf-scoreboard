pin = require('./linchpin')

pin.once 'calculateScore', (score) ->
  # Do some calculations with score

  pin.emit 'setScore', score: score
