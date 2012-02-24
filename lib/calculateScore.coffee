pin = require('linchpin')
mongode = require('mongode')
db = mongode.connect(process.env.MONGO or 'mongodb://127.0.0.1:27017/scoreboard')
scores = db.collection('scores')

# function to Round numbers
roundNum = (num, dec) ->
  Math.round(num*Math.pow(10,dec))/Math.pow(10,dec)

pin.on 'calculateScore', (score) ->

  # Do calculations with score for totals
  scores.find().toArray (err, result) ->
    scoresLength = result.length
    @total = 0
    for totals in result
      for key,val of totals
        if key == "score"
          @total += parseInt(val.score)
          averageScore = @total / scoresLength
          pin.emit 'displayTotal', roundNum(averageScore, 2)

  pin.emit 'setScore', score
