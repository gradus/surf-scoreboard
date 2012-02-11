mediator = require '../lib/linchpin'
require('../lib/score')

describe 'score', ->
  it 'should trigger scoring on emit', (done) ->
    mediator.emit 'score.new', 'score', (err, score) ->
      score.should.equal 1
      done()
      
