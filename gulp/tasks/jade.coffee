gulp = require('gulp')
jade = require('gulp-jade')
watch = require "gulp-watch"
connect = require "gulp-connect"
filter = require "gulp-filter"

paths = require('../../config').paths

compileJade = ->
	indexFilter = filter ['*'], restore: true
	otherFilesFilter = filter ['*']

	gulp
		.src(paths.src.jade)
		.pipe(jade(pretty: true))
			.on('error', console.log)
		.pipe indexFilter
		.pipe gulp.dest(paths.dest.root)
		.pipe(indexFilter.restore.pipe(gulp.dest(paths.dest.html)))
		.pipe connect.reload()

gulp.task 'jade', ->
	watch paths.src.jade, compileJade
	compileJade()
