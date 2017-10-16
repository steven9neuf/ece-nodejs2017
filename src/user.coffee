module.exports = 
	save: (name, pwd, callback) ->
		if callback is undefined
			callback = pwd
			callback new Error "Missing parameter"
		else
			console.log "Saving " + name + " with pwd " + pwd + "\n"
			callback()
	get: (name, callback) ->
		console.log "Saving " + name + "\n"
		callback()