fs = require 'fs'
csvjs = require '../lib/index'

data = fs.readFileSync('USPresident.csv').toString()
csvjs.parse data, { col_sep: ',', row_sep: "\r\n" }, (err, row) -> 
  console.log row

