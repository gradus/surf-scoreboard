                  ____   _________  __ |__| ______    
                _/ ___\ /  ___/\  \/ / |  |/  ___/     
                \  \___ \___ \  \   /  |  |\___ \       
                 \___  >____  >  \_/\__|  /____  >      
                     \/     \/     \______|    \/     
    
---

# csvjs 

- a csv parser library in javascript/coffeescript

## Install

``` bash
npm install csvjs

```

## Usage Example in CoffeeScript

``` coffeescript
fs = require 'fs'
csvjs = require 'csvjs'

data = fs.readFileSync('USPresident.csv').toString()
csvjs.parse data, { col_sep: ',', row_sep: "\r\n" }, (err, row) -> 
  console.log row

```

## Usage Example in JavaScript

``` javascript
var csvjs, data, fs;
fs = require('fs');
csvjs = require('csvjs');

data = fs.readFileSync('USPresident.csv').toString();

csvjs.parse(data, {
  col_sep: ',',
  row_sep: "\r\n"
}, function(err, row) {
  return console.log(row);
});

```

## Options

* col_sep = Column Seperator = default = ','
* row_sep = Row Seperator = default = '\r\n'
* keys = Define your own keys or if null use the first column for keys

## Examples

* see example folder

## License

* see LICENSE

## Contributions

* Please submit any pull requests or issues to make this lib awesome!
