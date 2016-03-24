gulp = require('gulp')
clean = require('gulp-clean')
paths = require('../../config').paths
gulp.task 'clean', (callback) ->
	gulp.src(paths.dest.root, read: false).pipe clean()
