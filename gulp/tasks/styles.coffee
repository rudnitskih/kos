gulp = require('gulp')
stylus = require('gulp-stylus')
watch = require('gulp-watch')
sass = require('gulp-sass')
concat = require('gulp-concat')
streamqueue = require('streamqueue')
_ = require('lodash')
livereload = require('gulp-livereload')
paths = require('../../config').paths
pjson = require('../../package.json')

compileStyles = ->
	streamqueue({ objectMode: true }, gulp.src(paths.src.css), gulp.src(paths.src.stylus).pipe(stylus(
		paths: [
			'node_modules'
			'./client/globals'
		]
		import: [
			'variables'
			'mixins'
		])).on('error', console.log), gulp.src(paths.src.sass).pipe(sass().on('error', sass.logError))).pipe(concat(pjson.name + '.css')).pipe(gulp.dest(paths.dest.styles))
	
	return

gulp.task 'styles', ->
	watch _.flatten([
		paths.src.css
		paths.src.stylus
		paths.src.sass
	]), compileStyles
	compileStyles()
