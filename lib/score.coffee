pin = require('linchpin')
events = require('events')
validateScore= require './validateScore'
mongo = require('mongoskin')
db = require('mongoskin').db(process.env.MONGO or 'localhost:27017/scoreboard')

class Score extends events.EventEmitter
  # Open Collection
  scores = db.collection('scores')
  scores.open -> console.log 'mongo.collection.scores.opened'

  listeners: ->
    @on 'save', ->
      # save to mongo
      scores.save this, (err, result) ->
        if err?
          console.log 'Error trying to save score to mongo'
        else
          @id = result._id unless @id?
          console.log result
          pin.emit 'setScore', this
  constructor: (data) ->
    # attach object kv of data to Score Instance
    @[k] = v for k,v of data
    @listeners()
    pin.emit 'newScore', this


pin.on 'newScore', (data) ->
  new Score(data)

pin.on 'validScore', (score) -> pin.emit 'score.save'

exports.Score = Score
