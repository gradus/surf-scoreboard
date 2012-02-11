pin = require('./linchpin')

pin.on 'calculateScore', (score) -> pin.emit 'setScore', score: score
