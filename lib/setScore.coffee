pin = require('linchpin')
mongode = require('mongode')
db = mongode.connect(process.env.MONGO or 'mongodb://127.0.0.1:27017/scoreboard')
scores = db.collection('scores')

pin.on 'setScore', (score) ->
  scores.find().sort({wave_count : -1 }).limit(1).toArray (err, wave) ->
    wave_count = wave[0].score['wave_count'] if wave[0]
    if wave_count == "1"
      console.log "is score with wave_count of 1 add 1"
      score['wave_count'] = "#{parseInt(wave_count) + 1}"
    else 
      console.log "is no score with wave count"
      score['wave_count'] = "1"

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

