#!/usr/bin/env coffee
express = require 'express'
routes  = require './routes'
http    = require 'http'

app = express()

app.configure ->
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use require('stylus').middleware src: "#{__dirname}/public"
  app.use express.static "#{__dirname}/public"
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use express.cookieParser 'onapalehorse'
  app.use express.session()
  app.use app.router

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index

http.createServer(app).listen 3000

console.log "Express server listening on port 3000"
