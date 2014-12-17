_ = require 'lodash'

getCells = (cells, sheet, callback) ->
  cells = [ "A4", "A5", "A6" ]
  result = _.map cells, (cell) -> sheet[cell]

  callback null, result

module.exports = getCells
