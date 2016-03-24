gulp = require('gulp')
nodemon = require('gulp-nodemon')
livereload = require('gulp-livereload')
paths = require('../../config').paths
gulp.task 'nodemon', ->
	nodemon(
		script: paths.server.main
		env: 'NODE_ENV': 'development'
		watch: [ 'server' ]).on 'restart'
