# gets a sheet
getSheet = (workbook, sheetName, callback) ->
  sheets = workbook.Sheets

  error = () ->
    unless sheets[sheetName]
      new Error "#{sheetName} not found"
    # if sheets[sheetName] then null else new Error "#{sheetName} not found"

  callback error(), sheets[sheetName]

module.exports = getSheet
