require './lib/init'
validateScore = require './lib/validateScore'
pin = require 'linchpin'
now = require 'now'
fs = require 'fs'
express = require 'express'
app = express.createServer()

everyone = now.initialize(app)

# Setup Static Files
app.use express.static(__dirname + '/public')
#app.use(express.logger())
app.use express.bodyParser()
app.use express.cookieParser()
#app.use express.session({ secret: "shaka shaka" })()

# App Routes
app.get '/', (req, resp) ->
  resp.writeHead 200, "Content-Type": "text/html"
  resp.end fs.readFileSync('./public/index.html')

app.post '/', express.bodyParser(), (req, resp) ->
  resp.cookie('judge_name', req.body.judge_name, { maxAge: 12000 * 10000 })
  resp.cookie('heat_num', req.body.heat_num, { maxAge: 400 * 10000 })
  resp.cookie('surfer_1', req.body.surfer_1, { maxAge: 400 * 10000 })
  resp.cookie('surfer_2', req.body.surfer_2, { maxAge: 400 * 10000 })
  resp.cookie('surfer_3', req.body.surfer_3, { maxAge: 400 * 10000 })
  resp.cookie('surfer_4', req.body.surfer_4, { maxAge: 400 * 10000 })
  resp.cookie('surfer_5', req.body.surfer_5, { maxAge: 400 * 10000 })
  resp.cookie('surfer_6', req.body.surfer_6, { maxAge: 400 * 10000 })
  resp.redirect '#scores'
  #resp.end fs.readFileSync('./public/index.html')

app.post '/scores', express.bodyParser(), (req, resp) ->
  result = validateScore(req.body)
  if result.valid
    pin.on 'displayScore', (score) ->
     resp.json errors: null, score: score
    pin.emit 'calculateScore', req.body
    #resp.end
  else
    resp.json errors: result.errors, score: null
    #resp.end

# Listen
app.listen 3000, -> console.log 'Listening on port 3000'

pin.on 'displayScore', (score) ->
  everyone.now.displayScore(score)
pin.on 'setTotal', (averageScore) ->
  everyone.now.displayTotal(averageScore)
