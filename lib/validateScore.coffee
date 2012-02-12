revalidator = require 'revalidator'
pin = require('linchpin')
mongo = require('mongoskin')
db = mongo.db(process.env.MONGO or 'localhost:27017/scoreboard')

# Open Collection
scores = db.collection('scores')
scores.open -> console.log 'mongo.collection.scores.opened', 'successfully'

# Validate Scores Connect Middleware
module.exports = ->
  (req, resp, next) ->

    result = revalidator.validate req.body,
      properties:
        name:
          description: 'score is required'
          type: 'number'
          minLength: 1
          required: true
 
    return next() if result.valid
    #resp.cookies.errors = result.errors
    if scores
      scores = scores.findEach {}, (err, score) -> console.log score

    resp.render 'index', title: 'ScoreBoard', errors: result.errors, data: req.body.score
    pin.emit 'score.new', req.body.score


