revalidator = require 'revalidator'
pin = require('./linchpin')
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
    resp.render 'index', title: 'ScoreBoard', errors: result.errors, data: req.body.score
    pin.emit 'score.new', req.body.score


