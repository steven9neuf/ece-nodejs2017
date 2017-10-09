module.exports = {
	save: function(name, pwd, callback) {
		if(callback == null){
			callback = pwd
			callback(new Error("Missing parameter"))
		}
		else{
			console.log("saving " + name + " with pwd " + pwd)
			callback()
		}
	},
	get: function(name, callback) {
		console.log("saving " + name)
		callback()
	}
}