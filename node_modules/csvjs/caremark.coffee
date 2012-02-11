fs = require 'fs'
csvjs = require 'csvjs'

data = fs.readFileSync('Caremark 10_01_11.txt').toString()
csvjs.parse data, col_sep: ';', (err, row) -> console.log JSON.stringify(row) + ','

