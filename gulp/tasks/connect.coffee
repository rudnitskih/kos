gulp = require "gulp"
connect = require "gulp-connect"

gulp.task "connect", ->
	connect.server
		root: "public"
		livereload: true