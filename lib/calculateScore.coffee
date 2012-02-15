pin = require('linchpin')

pin.on 'score.process', (score) ->
  # Do some calculations with score
  pin.emit 'setScore', score
