pin = require('linchpin')

pin.on 'setScore', (score) ->
  pin.emit 'displayScore', score
  pin.emit 'validScore', score
  #pin.emit 'score.end', score
