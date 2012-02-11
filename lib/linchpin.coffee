class Linchpin extends require('events').EventEmitter
  constructor: -> @setMaxListeners(0)

global.linchpin ?= new Linchpin

module.exports = global.linchpin
