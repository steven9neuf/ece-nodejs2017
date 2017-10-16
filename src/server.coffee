user = require "./user.coffee"
fs = require 'fs'
url = require 'url'
pug = require 'pug'

renderResource = (filename, type, res, callback) ->
	if type == 'html'
		# pug rendering
		pug.renderFile "views/index.pug", (err, file) ->
			throw err if err
			res.writeHead 200,
				'Contnt-Type: "text/#{type}"'
			res.write file
			res.end()

	else if type == 'css'
		# css => stylus
		fs.readFile "public/#{type}/#{filename}", (err, file) ->
			throw err if err
			res.writeHead 200,
				'Contnt-Type: "text/#{type}"'
			res.write file
			res.end()

# Import a module
module.exports = 
	logic: (req, res) ->
		url = url.parse req.url
		[_, directory, filetype, filename] = url.pathname.split "/"
		directory = "/" if directory == ""
		console.log directory
		switch directory
			when "/"
				renderResource "index.pug", "html", res
			when "save"
				user.save "testu", "testpwd", () ->
					# Write a response header 201 - created
					res.writeHead 201, 
						'Content-Type': 'text/plain'
					res.end 'User is saved'
			when "get"
				user.get "testu", () ->
					res.writeHead 200, 
						'Content-Type': 'text/plain'
					res.end 'Got the user'
			when "public"
				renderResource "main.css", "css", res
			else
				res.writeHead 404, 
					'Content-Type': 'text/plain'
				res.end 'Route not found'



		###	

		if req.url == "/save" 
			user.save "testu", "testpwd", () ->
				# Write a response header 201 - created
				res.writeHead 201, 
					'Content-Type': 'text/plain'
				res.end 'User is saved'
		else if req.url == "/get"
			user.get "testu", () ->
				res.writeHead 200, 
					'Content-Type': 'text/plain'
				res.end 'Got the user'
		else if req.url == "/"
			fs.readFile "public/html/index.html", (err, html) ->
				throw err if err
				res.writeHead 200, 
					'Content-Type': 'text/html'
				res.write html
				res.end()
		else if req.url == "/public/main/main.css"
			fs.readFile "public/css/main.css", (err, css) ->
				throw err if err
				res.writeHead 200, 
					'Content-Type': 'text/css'
				res.write css
				res.end()
		else
			res.writeHead 404, 
				'Content-Type': 'text/plain'
			res.end 'Route not found'
		###
	port: "8888"
	address: "127.0.0.1"

