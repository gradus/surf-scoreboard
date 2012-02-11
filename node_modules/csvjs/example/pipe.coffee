fs = require 'fs'
csvjs = require '../lib/index'

data = fs.readFileSync('unbreakable_updates.csv').toString()
console.log data.split '\n'
csvjs.parse data, { col_sep: '|', row_sep: "\n" }, (err, row) -> 
  console.log row

