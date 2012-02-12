pin = require('linchpin')
mongo = require('mongoskin')
db = mongo.db(process.env.MONGO or 'localhost:27017/scoreboard')

# Open Collection
scores = db.collection('scores')
scores.open -> console.log 'mongo.collection.scores.opened', 'successfully'

pin.once 'setScore', (score) ->
  #save score to the database
  scores.save score, upsert: true, (err, result) =>
    if err?
      pin.emit 'score.error', 'Error trying to save score to db'
    else
      @id = result._id unless @id?
      pin.emit 'score.end', result

