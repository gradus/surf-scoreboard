pin = require('linchpin')
mongo = require('mongoskin')
db = require('mongoskin').db(process.env.MONGO or 'localhost:27017/scoreboard')

# Open Collection
scores = db.collection('scores')
scores.open -> pin.emit 'mongo.collection.scores.opened'

# function to Round numbers
roundNum = (num, dec) ->
	Math.round(num*Math.pow(10,dec))/Math.pow(10,dec)


pin.on 'calculateScore', (score) ->
  # Do calculations with score
  scores.find().toArray (err, result) ->
    scoresLength = result.length
    @total = 0
    for totals in result
      for key,val of totals
        if key == "score"
          @total += parseInt(val.score)
          averageScore = @total / scoresLength
          pin.emit 'setTotal', roundNum(averageScore, 2)
  pin.emit 'setScore', score
