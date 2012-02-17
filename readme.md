# Scoreboard

Framework: express
 
Client: Ember.JS

DataStore: MongoDB
 
# About

The purpose of this application is to help scoring for surf contests.
This is only the start. Using this application to practice an event
driven coffee-script pattern with EventEmmiter. Not yet functional

# Install

``` sh
install mongo using homebrew:

  $ brew update
  $ brew install mongodb
  $ sudo mkdir -p /data/db/
  $ sudo chown `id -u` /data/db

git clone git@github.com:gradus/surf-scoreboard.git 
cd surf-scoreboard
npm install .
```

# Usage
``` sh
start mongo in another terminal window with mongod
node server.js
visit localhost:3000
```

# Testing

``` sh
start mongo
[sudo] npm install mocha -g
mocha
```

# Feedback

# License

Copyright (c) 2012 Kris Windham

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


# Contributors

Kris Windham

Thanks to Tom Wilson @twilson63 for linchpin, cupcake generator, introducing me to twitter bootstrap, giving me a Cakefile template, introducing me to mocha and helping me understand this event driven coffeescript pattern.

