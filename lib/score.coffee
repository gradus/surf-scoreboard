pin = require('./linchpin')
events = require('events')

class Score extends events.EventEmitter
 	constructor: (data) ->
    @[k] = v for k,v of data
    pin.emit 'newScore', this

pin.on 'score.new', (score) ->
  new Score(score)

pin.on 'newScore', (score) ->
  pin.emit 'calculateScore', score

exports.Score = Score
