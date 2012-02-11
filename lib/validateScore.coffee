revalidator = require 'revalidator'

# Validate Scores Connect Middleware
module.exports = ->
  (req, resp, next) ->
    #req.body.cpnFile = req.files.cpnFile.name
    #revalidator.validate.messages.score = 'Name is Required...'


    result = revalidator.validate req.body,
      properties:
        name:
          description: 'score is required'
          type: 'string'
          minLength: 1
          required: true
 
    return next() if result.valid
    
    #resp.cookies.errors = result.errors
    console.log req.body.score
    resp.render 'index', title: 'ScoreBoard', errors: result.errors, data: req.body.score

