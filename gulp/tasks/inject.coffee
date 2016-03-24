gulp = require "gulp"
inject = require "gulp-inject"
jade = require "gulp-jade"
connect = require "gulp-connect"
watch = require "gulp-watch"
using = require('gulp-using')

paths = require("../../config").paths


compileIndex = ->
	sources = gulp.src [paths.dest.scripts + "/**.*", paths.dest.styles + + "/**.*"], {read: false}
		.pipe(using())

	gulp
		.src paths.src.index
		.pipe(jade(pretty: true))
			.on('error', console.log)
		.pipe(inject(sources))
		.pipe gulp.dest(paths.dest.root)
		.pipe connect.reload()

gulp.task 'inject', ->
	watch paths.src.index, compileIndex
	compileIndex()