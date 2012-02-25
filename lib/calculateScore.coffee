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
    ## Needs Refactor !!!!!

    @total = 0
    @total2 = 0
    @total3 = 0
    @total4 = 0
    @total5 = 0
    @total6 = 0
    for totals in result
      if totals.score.score != ""
        @total += parseInt(totals.score.score)
        averageScore = @total / scoresLength
        pin.emit 'displayTotalYellow', roundNum(averageScore, 2)
      if totals.score.score2 != ""
        @total2 += parseInt(totals.score.score2)
        averageScore = @total2 / scoresLength
        pin.emit 'displayTotalRed', roundNum(averageScore, 2)
      if totals.score.score3 != ""
        @total3 += parseInt(totals.score.score3)
        averageScore = @total3 / scoresLength
        pin.emit 'displayTotalGreen', roundNum(averageScore, 2)
      if totals.score.score4 != ""
        @total4 += parseInt(totals.score.score4)
        averageScore = @total4 / scoresLength
        pin.emit 'displayTotalBlue', roundNum(averageScore, 2)
      if totals.score.score5 != ""
        @total5 += parseInt(totals.score.score5)
        averageScore = @total5 / scoresLength
        pin.emit 'displayTotalWhite', roundNum(averageScore, 2)
      if totals.score.score != ""
        @total6 += parseInt(totals.score.score6)
        averageScore = @total6 / scoresLength
        pin.emit 'displayTotalOrange', roundNum(averageScore, 2)
  pin.emit 'setScore', score
