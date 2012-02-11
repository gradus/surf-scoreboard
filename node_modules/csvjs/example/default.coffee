fs = require 'fs'
csvjs = require '../index'

# Example using default options....
data = fs.readFileSync('USPresident.csv').toString()
csvjs.parse data, (err, row) -> 
  console.log row
