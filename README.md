# Coverage Blamer

Coverage Blamer helps found author, date and files of uncovered code. Coverage Blamer use coverage 
report in json format generated by [istanbul](https://github.com/gotwarlost/istanbul) or [jscoverage](https://github.com/fishbar/jscoverage) and information 
about date and author from git or svn.

##Status

[![Dependency Status](https://gemnasium.com/kucherenko/coverage-blamer.svg)](https://gemnasium.com/kucherenko/coverage-blamer)
[![Build Status](https://travis-ci.org/kucherenko/coverage-blamer.svg?branch=master)](https://travis-ci.org/kucherenko/coverage-blamer)
[![Coverage Status](https://coveralls.io/repos/kucherenko/coverage-blamer/badge.svg?branch=master&service=github)](https://coveralls.io/github/kucherenko/coverage-blamer?branch=master)

[![NPM](https://nodei.co/npm/coverage-blamer.png)](https://nodei.co/npm/coverage-blamer/)
 
##Installation

```
npm install -g coverage-blamer
```

##Usage

```
$ coverage-blamer --help

  Usage: coverage-blamer [options]

  Options:

    -h, --help                  output usage information
    -V, --version               output the version number
    -c, --coverage <path>       Path to coverage report
    -v, --vcs [type]            Version control system
    -s, --source <path>         Path to source folder
    -o, --output <path>         Path to output folder
    -r, --disableRow <boolean>  Disable row coverage in report
```

##Example

Coverage Blamer CLI report generated for moment.js:

```
$ coverage-blamer --coverage .nyc_output/6155.json --source ./
┌──────────────────────────────────────────────────┬───────────────┬───────────────┬───────────────┐
│ Author                                           │ Lines         │ Uncovered Li… │ Coverage      │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Alexander Jeng                                   │ 2             │ 1             │ 50%           │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Tim Wood                                         │ 203           │ 80            │ 60.591133004… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Brian Wyant                                      │ 39            │ 13            │ 66.666666666… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Isaac Cambron                                    │ 25            │ 5             │ 80%           │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Iskren Chernev                                   │ 550           │ 59            │ 89.272727272… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ paladox                                          │ 27            │ 0             │ 100%          │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Igor Lima                                        │ 14            │ 0             │ 100%          │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Dan Dascalescu                                   │ 25            │ 0             │ 100%          │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Mehul Patel                                      │ 1             │ 0             │ 100%          │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Lachèze Alexandre                                │ 39            │ 0             │ 100%          │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Dennis                                           │ 9             │ 0             │ 100%          │
└──────────────────────────────────────────────────┴───────────────┴───────────────┴───────────────┘
┌──────────────────────────────────────────────────┬───────────────┬───────────────┬───────────────┐
│ File                                             │ Lines         │ Uncovered Li… │ Coverage      │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/history.js                               │ 123           │ 56            │ 54.471544715… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/size.js                                  │ 59            │ 24            │ 59.322033898… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/component.js                             │ 10            │ 4             │ 60%           │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/embed_locales.js                         │ 47            │ 17            │ 63.829787234… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/zones.js                                 │ 70            │ 24            │ 65.714285714… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/check_sauce_creds.js                     │ 13            │ 4             │ 69.230769230… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/bump_version.js                          │ 65            │ 7             │ 89.230769230… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ ./tasks/transpile.js                             │ 288           │ 22            │ 92.361111111… │
└──────────────────────────────────────────────────┴───────────────┴───────────────┴───────────────┘
┌──────────────────────────────────────────────────┬───────────────┬───────────────┬───────────────┐
│ Date                                             │ Lines         │ Uncovered Li… │ Coverage      │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Mon Aug 20 2012                                  │ 178           │ 77            │ 56.497175141… │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Tue Aug 21 2012                                  │ 6             │ 2             │ 60%           │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Fri Aug 31 2012                                  │ 9             │ 0             │ 100%          │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
│ Wed Oct 03 2012                                  │ 1             │ 1             │ 0%            │
├──────────────────────────────────────────────────┼───────────────┼───────────────┼───────────────┤
```


##TODO
[TODO](https://github.com/kucherenko/coverage-blamer/blob/master/TODO.md)

##License

[The MIT License](https://github.com/kucherenko/coverage-blamer/blob/master/LICENSE)
