pin = require('linchpin')
events = require('events')
#validateClaim = require './validateScore'
#mongo = require('mongoskin')
#db = require('mongoskin').db(process.env.MONGO or 'localhost:27017/scoreboard')

## Open Collection
#scores = db.collection('scores')
#scores.open -> pin.emit 'mongo.collection.scores.opened', 'successfully'


class Score extends events.EventEmitter

  listeners: ->
    @on 'save', ->
      #scores.save this, upsert: true, (err, result) =>
        #if err?
          #pin.emit 'score.error', 'Error trying to save score to mongo'
        #else
      @id = result._id unless @id?
      pin.emit 'setScore', this
  constructor: (data) ->
    # attach object kv of data to Score Instance
    @[k] = v for k,v of data
    @listeners()
    pin.emit 'newScore', this


pin.on 'score.new', (data) -> 
  new Score(data)

pin.on 'validScore', (score) -> score.emit 'save'

exports.Score = Score
