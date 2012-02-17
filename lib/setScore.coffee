pin = require('linchpin')
mongo = require('mongoskin')
db = require('mongoskin').db(process.env.MONGO or 'localhost:27017/scoreboard')
# Open Collection
scores = db.collection('scores')
scores.open -> pin.emit 'mongo.collection.scores.opened'

pin.on 'setScore', (score) ->
  scores.save score, (err, result) ->
    if err?
      console.log 'Error trying to save score to mongo'
    else
      @id = result._id unless @id?
  pin.emit 'saveScore', score
  pin.emit 'displayScore', score

