var user = require("./user.js")

// Import a module
module.exports = {
	logic: function (req, res) {
		console.log(req.url)
		if(req.url == "/save"){
			user.save("testu", "testpwd", function(){
				// Write a response header 201 - created
				res.writeHead(201, {'Content-Type': 'text/plain'});
				res.end('User is saved');
			})
		}
		else if(req.url == "/get"){
			user.get("testu", function(){
				res.writeHead(200, {'Content-Type': 'text/plain'});
				res.end('Got the user');
			})
		}
		else if(req.url == "/"){
			console.log("Hello, I'm in a function");
			res.writeHead(200, {'Content-Type': 'text/plain'});
			res.end('Hello World\n');
		}
		else{
			res.writeHead(404, {'Content-Type': 'text/plain'});
			res.end('Route not found');
		}
	},
	port: "8888",
	address: "127.0.0.1"
}
