pin = require('./linchpin')

pin.on 'setScore', (score) -> pin.emit 'score.end', score

