express = require 'express'

app = express()

allowCrossDomain = (req, res, next) ->
    res.header('Access-Control-Allow-Origin', '*')
    res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE')
    res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization')

    if 'OPTIONS' is req.method
      res.send 200
    else
      next()

app.configure ->
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use allowCrossDomain

app.configure "development", ->
    app.use express.logger('dev')
    app.use express.errorHandler(
        dumpExceptions: true
        showStack: true
    )

app.configure "production", ->
    app.use express.errorHandler()

project = {
    projects: [
        {id: 1, name: 'project 1'}
        {id: 2, name: 'project 2'}
        {id: 3, name: 'project 3'}
    ]
}

single = {
    project:
        {id: 1, name: 'project 1'}
}

app.get '/projects', (req, res) ->
    res.json project

app.get '/projects/:id', (req,res) ->
    res.json single

app.listen 3000