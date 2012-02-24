pin = require('linchpin')
mongode = require('mongode')
db = mongode.connect(process.env.MONGO or 'mongodb://127.0.0.1:27017/scoreboard')
scores = db.collection('scores')

pin.on 'setScore', (score) ->
  scores.insert score: score, (err, result) ->
    if err?
      console.log 'Error trying to save score to mongo'
    else
      @id = result._id unless @id?
  pin.emit 'saveScore', score
  pin.emit 'displayScoreYellow', score
  pin.emit 'displayScoreRed', score
  pin.emit 'displayScoreGreen', score
  pin.emit 'displayScoreBlue', score
  pin.emit 'displayScoreWhite', score
  pin.emit 'displayScoreOrange', score

