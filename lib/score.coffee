pin = require('./linchpin')
events = require('events')
#mongo = require('mongoskin')
#db = require('mongoskin').db(process.env.MONGO or 'localhost:27017/billing')

class Score extends events.EventEmitter
 	constructor: (data) ->
    @[k] = v for k,v of data
    pin.emit 'newScore', this

pin.once 'score.new', (score) ->
  new Score(score)

pin.once 'newScore', (score) ->
  pin.emit 'calculateScore', score

exports.Score = Score
