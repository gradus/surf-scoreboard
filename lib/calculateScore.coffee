pin = require('./linchpin')

pin.on 'calculateScore', (score) ->
  console.log 'yo'
  # Do some calculations with score
  score = (parseInt { score: score }) + 1
  pin.emit 'setScore', score: score
