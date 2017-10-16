http = require 'http'
server = require './server.coffee'
http.createServer(server.logic).listen 8888, '127.0.0.1'