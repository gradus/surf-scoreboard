pin = require('linchpin')

pin.on 'setScore', (score) ->
  console.log score
  pin.emit 'displayScore', score
  pin.emit 'score.end', score 

