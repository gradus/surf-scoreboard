pin = require('./linchpin')

pin.once 'calculateScore', (score) ->
  # Do some calculations with score
  delete score['_events']
  pin.emit 'setScore', score: score
