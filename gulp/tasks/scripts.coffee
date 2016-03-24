gulp = require('gulp')
watch = require('gulp-watch')
coffee = require('gulp-coffee')
filter = require('gulp-filter')
concat = require('gulp-concat')
livereload = require('gulp-livereload')
plumber = require('gulp-plumber')
angularFilesort = require('gulp-angular-filesort')
ngAnnotate = require('gulp-ng-annotate')
paths = require('../../config').paths
pjson = require('../../package.json')

compileScripts = ->
	gulp
		.src(paths.src.scripts)
		.pipe(plumber())
		.pipe(coffee(bare: true))
		.on('error', console.log)
		.pipe(angularFilesort())
		.pipe(ngAnnotate())
		.pipe(concat(pjson.name + '.js'))
		.pipe(gulp.dest(paths.dest.scripts))
		.pipe livereload()
	return

gulp.task 'scripts', ->
	watch [ paths.src.scripts ], compileScripts
	compileScripts()
