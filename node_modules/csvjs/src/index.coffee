# # csvjs
# simple csv parser with header row expected

class CsvJs extends require('events').EventEmitter 
  DEFAULT_OPTIONS: { col_sep: ",", row_sep: "\n", keys: null }
  # parse csv data and return each row as a pojso
  # params
  # data - csv data you want to parse
  # options - optional overrides to row_separator,
  #           col_seperator, and header.
  #
  #
  # callback returns (err, row)
  #
  parse: (data, options={}, cb) ->
    if typeof(options) == 'function'
      cb = options
      options = {} 

    return cb('error no data') unless data?

    options = @_extend(@DEFAULT_OPTIONS, options)
    rows = @_split(data, options.row_sep)

    # remove last record nothing there
    rows.pop() if rows[rows.length - 1].length < 5

    # get headers
    keys = @_split rows.shift(), options.col_sep unless options.keys?
    # return each row
    for row, c in rows
      # remove cr if present
      row = row.replace /\r$/, ''
      values = @_split row, options.col_sep
      cb(null, @_merge(keys, values))
    
    @emit 'end', rows.length

  # ## private methods
  #
  # extend obj
  _extend: (obj, mixin) ->
    obj[name] = method for name, method of mixin
    obj
  # split a string into an array
  _split: (data, sep) -> data.split(sep)
  # clean up and trim columns
  _tidy: (field) -> field?.trim().replace(/^\"/, '').replace(/\"$/,'').trim()
  # merge arrays into an object
  _merge: (keys, values) ->
    output = {}
    output[@_tidy(key)] = @_tidy(values[i]) for key, i in keys
    output
      
  

module.exports = new CsvJs()