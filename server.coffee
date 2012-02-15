pin = require 'linchpin'
now = require 'now'
require './lib/init'
validateScore = require './lib/validateScore'

express = require 'express'
app = express.createServer()

everyone = now.initialize(app)

# Setup Static Files
app.use express.static(__dirname + '/public')
#app.use(express.logger())
app.use(express.bodyParser())

 #Setup Assets
#app.use require('connect-assets')()

# App Routes
app.get '/', (req, resp) ->
  resp.writeHead 200, "Content-Type": "text/html"
  resp.end fs.readFileSync('./public/index.html')

app.post '/scores', express.bodyParser(), (req, resp) ->
  result = validateScore(req.body)
  if result.valid
    pin.on 'displayScore', (score) ->
     resp.json errors: null, score: score
    pin.emit 'calculateScore', req.body
  else
    resp.json errors: result.errors, records: null

# Listen
app.listen 3000, -> console.log 'Listening on port 3000'

pin.on 'displayScore', (score) ->
  everyone.now.displayScore(score.score)
