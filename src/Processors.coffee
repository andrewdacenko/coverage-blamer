_ = require 'lodash'

prepareDate = (string) ->
  d = new Date string
  (new Date d.toLocaleDateString()).getTime() / 1000

sortByCoverage = (a, b) ->
  return 1 if a.coverage > b.coverage
  return -1 if a.coverage < b.coverage
  return 0


sortObjectByCoverage = (object) ->
  results = {}
  keysSorted = Object.keys(object).sort (a, b) ->
    return 1 if object[a].coverage > object[b].coverage
    return -1 if object[a].coverage < object[b].coverage
    return 0
  results[key] = object[key] for key in keysSorted
  results


normalizeAuthorName = (name)->
  name = name.replace /^\s*|\s*$/g, ''
  name.toUpperCase()

getAuthorTemplate = (name, date) ->
  author =
    "author": name
    "lines": 0
    "uncoveredLines": 0
    "dates": {}
  author.dates[date] =
    "lines": 0
    "uncoveredLines": 0
  author


process = (result) ->
  authors = {}
  dates = {}
  uncoveredLines = 0
  lines = 0
  for file in result.files
    file.lines = 0
    file.uncoveredLines = 0
    _.forOwn file.source, (line) ->
      if not line.date then return
      authorName = normalizeAuthorName line.author
      author = authors[authorName]
      date = prepareDate line.date
      console.log 'Date Error:', line.date if isNaN date
      return if isNaN date

      if not author
          author = getAuthorTemplate line.author, date
          authors[authorName] = author

      if not author.dates[date]
          author.dates[date] =
            "lines": 0
            "uncoveredLines": 0
      dates[date] = dates[date] ? _.clone author.dates[date]

      if line.coverage isnt ''
        lines++
        file.lines++
        author.lines++
        author.coverage = 100 - (author.uncoveredLines / author.lines) * 100
        dates[date].coverage = 100 - (dates[date].uncoveredLines / dates[date].lines) * 100
        author.dates[date].lines++
        dates[date].lines++

      if line.coverage is 0
        uncoveredLines++
        file.uncoveredLines++
        author.uncoveredLines++
        author.dates[date].uncoveredLines++
        dates[date].uncoveredLines++
        author.coverage = 100 - (author.uncoveredLines / author.lines) * 100
        dates[date].coverage = 100 - (dates[date].uncoveredLines / dates[date].lines) * 100
    file.coverage = 100 - (file.uncoveredLines / file.lines) * 100

  result.dates = dates
  result.authors = sortObjectByCoverage authors
  result.files = result.files.sort sortByCoverage if result.files
  result.uncoveredLines = uncoveredLines
  result.lines = lines
  result.coverage = 100 - (uncoveredLines/lines)*100
  return result

module.exports =
  process: process
