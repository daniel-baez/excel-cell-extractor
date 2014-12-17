async = require 'async'
_ = require 'lodash'

defaultConfig = require './config.json'

getSheet = require './getSheet'
getCells = require './getCells'

newParser = (extractions) ->
  (workbook, cb) ->

    # creates the extractions for each config
    extractions = _.mapValues extractions, (extraction) ->
      (callback) ->
        async.waterfall [
          _.partial getSheet, workbook, extraction.sheetName
          _.partial getCells, extraction.cells
        ], callback

    # executes each extraction
    async.parallel extractions, cb

exported = newParser defaultConfig
exported.newParser = newParser

module.exports = exported
