revalidator = require 'revalidator'

## Validate Scores Connect Middleware
module.exports = (validateScore) ->
  revalidator.validate.messages.score = 'Score Value is Required...'

  result = revalidator.validate validateScore,
    properties:
      score:
        description: 'Score is required'
        type: 'string'
        minLength: 1
        required: true
  result


