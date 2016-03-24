gulp = require('gulp')
runSequence = require('run-sequence')
gulp.task 'default', (callback) ->
	runSequence 'clean', [
		'jade'
		'scripts'
		'bower'
		'styles'
		"connect"
	]
