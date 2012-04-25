#!/usr/bin/env coffee
port = 8080

# Dependencies
express = require 'express'
routes  = require './routes'
http    = require 'http'

app = express()

app.configure ->
  app.set 'views', "#{__dirname}/views"
  app.set 'view engine', 'jade'
  app.use express.favicon()
  app.use express.logger 'dev'
  app.use require('less-middleware') src: "#{__dirname}/public"
  app.use express.static "#{__dirname}/static"
  app.use express.bodyParser()
  app.use express.cookieParser 'hacher'
  app.use express.session()
  app.use app.router

app.configure 'development', ->
  app.use express.errorHandler()

app.get '/', routes.index

http.createServer(app).listen port

console.log "Express server listening on port #{port}"
