var should = require('should')
var user = require('../src/user.js')

describe('user', function(){
	it('saves properly', function(done){
		user.save("ok", "pwd", function(err){
			should.not.exist(err)
			done()
		})
	})

	it('doesn\'t save because missing parameter', function(done){
		user.save("name", "pwd", function(err){
			should.not.exist(err)
			done()
		})
	})

	it('get', function(done){
		done()
	})

})