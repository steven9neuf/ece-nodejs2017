#var should = require('should')
#var user = require('../src/user.js')
#
#describe('user', function(){
	#it('saves properly', function(done){
		#user.save("ok", "pwd", function(err){
			#should.not.exist(err)
			#done()
		#})
	#})
#
	#// We send only 2 parameters instead of 3. We expect to get an error
	#it('doesn\'t save because missing parameter', function(done){
		#user.save("only name", function(err){
			#should.exist(err)
			#done()
		#})
	#})
#
	#it('get', function(done){
		#user.get("Steven", function(err){
			#should.not.exist(err)
			#done()
		#})
	#})
#
#})

# COFFEESCRIPT
should = require 'should'
user = require '../src/user.coffee'
describe 'user', () ->
	it 'saves properly\n', (done) ->
		user.save "ok", "pwd", (err) ->
			should.not.exist err
			done()
	# We send only 2 parameters instead of 3. We expect to get an error
	it 'doesn\'t save because missing parameter\n', (done) ->
		user.save "only name", (err) ->
			should.exist err
			done()
	it 'get', (done) ->
		user.get "Steven\n", (err) ->
			should.not.exist err
			done()
		
	

