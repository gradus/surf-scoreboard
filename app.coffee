pin = require 'linchpin'
now = require 'now'
require './lib/init'
validateScore = require './lib/validateScore'

jade = require 'jade'
express = require 'express'
app = express.createServer()

everyone = now.initialize(app)

app.register '.jade'
app.set 'view engine', 'jade'

# Setup Static Files
app.use express.static(__dirname + '/public')
#app.use(express.logger())
app.use(express.bodyParser())

app.use express.cookieParser()
app.use express.session secret: 'goobers'

# Setup Assets
app.use require('connect-assets')()

# App Routes
app.get '/', (req, resp) ->
  resp.render 'index', title: 'Scoreboard', errors: null, data: null

app.post '/', validateScore(), (req, resp) ->
  pin.emit 'score.new', req.body.score

# Listen
app.listen 3000, -> console.log 'Listening on port 3000'

pin.on 'newActivity', (activity) ->
  everyone.now.newActivity activity
