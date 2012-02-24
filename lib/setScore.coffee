pin = require('linchpin')
mongode = require('mongode')
db = mongode.connect(process.env.MONGODB or 'scoreboard', process.env.MONGO or '127.0.0.1', port: process.env.MONGOPORT or 27017)
scores = db.collection('scores')

pin.on 'setScore', (score) ->
  scores.insert score: score, (err, result) ->
    if err?
      console.log 'Error trying to save score to mongo'
    else
      @id = result._id unless @id?
  pin.emit 'saveScore', score
  pin.emit 'displayScore', score

