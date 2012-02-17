pin = require('linchpin')
mongo = require('mongoskin')
db = require('mongoskin').db(process.env.MONGO or 'localhost:27017/scoreboard')
# Open Collection
scores = db.collection('scores')
scores.open -> pin.emit 'mongo.collection.scores.opened'

pin.on 'calculateScore', (score) ->
  # Do calculations with score
  scores.find().toArray (err, result) ->
    @total = 0
    for totals in result
      for key,val of totals
        if key == "score"
          @total += parseInt(val)
          pin.emit 'setTotal', total: @total
  pin.emit 'setScore', score
