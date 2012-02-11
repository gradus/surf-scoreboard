csvjs = require '../lib/index'

data = """
col1, col2, col3
1,2,3
    """

describe 'csvjs', ->
  describe '#parse', ->
    it 'is successful with basic header csv', ->
      csvjs.parse data, {row_sep: "\n"}, (err, row) -> 
        keys = (key for key, v of row)
        expect(keys).toEqual ['col1', 'col2', 'col3']
    it 'is successful with standard data', -> 
      csvjs.parse data, {row_sep: "\n"}, (err, row) ->
        values = (v for k, v of row)
        expect(values).toEqual [ '1', '2', '3']
    it 'lets user know error occured via parsing', ->
      csvjs.parse null, (err, row) ->
        expect(err).toEqual('error no data')
