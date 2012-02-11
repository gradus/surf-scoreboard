(function() {
  var CsvJs;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  CsvJs = (function() {

    __extends(CsvJs, require('events').EventEmitter);

    function CsvJs() {
      CsvJs.__super__.constructor.apply(this, arguments);
    }

    CsvJs.prototype.DEFAULT_OPTIONS = {
      col_sep: ",",
      row_sep: "\n",
      keys: null
    };

    CsvJs.prototype.parse = function(data, options, cb) {
      var c, keys, row, rows, values, _len;
      if (options == null) options = {};
      if (typeof options === 'function') {
        cb = options;
        options = {};
      }
      if (data == null) return cb('error no data');
      options = this._extend(this.DEFAULT_OPTIONS, options);
      rows = this._split(data, options.row_sep);
      if (rows[rows.length - 1].length < 5) rows.pop();
      if (options.keys == null) keys = this._split(rows.shift(), options.col_sep);
      for (c = 0, _len = rows.length; c < _len; c++) {
        row = rows[c];
        row = row.replace(/\r$/, '');
        values = this._split(row, options.col_sep);
        cb(null, this._merge(keys, values));
      }
      return this.emit('end', rows.length);
    };

    CsvJs.prototype._extend = function(obj, mixin) {
      var method, name;
      for (name in mixin) {
        method = mixin[name];
        obj[name] = method;
      }
      return obj;
    };

    CsvJs.prototype._split = function(data, sep) {
      return data.split(sep);
    };

    CsvJs.prototype._tidy = function(field) {
      return field != null ? field.trim().replace(/^\"/, '').replace(/\"$/, '').trim() : void 0;
    };

    CsvJs.prototype._merge = function(keys, values) {
      var i, key, output, _len;
      output = {};
      for (i = 0, _len = keys.length; i < _len; i++) {
        key = keys[i];
        output[this._tidy(key)] = this._tidy(values[i]);
      }
      return output;
    };

    return CsvJs;

  })();

  module.exports = new CsvJs();

}).call(this);
