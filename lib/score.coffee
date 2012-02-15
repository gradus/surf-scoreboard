pin = require('linchpin')
events = require('events')
validateScore= require './validateScore'

class Score extends events.EventEmitter

  listeners: ->
    @on 'save', ->
      pin.emit 'setScore', this
  constructor: (data) ->
    # attach object kv of data to Score Instance
    @[k] = v for k,v of data
    @listeners()
    pin.emit 'newScore', this


pin.on 'newScore', (data) ->
  new Score(data)

pin.on 'validScore', (score) -> pin.emit 'score.save', score

exports.Score = Score
