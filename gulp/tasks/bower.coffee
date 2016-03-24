gulp = require('gulp')
bower = require('main-bower-files')
filter = require('gulp-filter')
paths = require('../../config').paths
destPaths = paths.dest
gulp.task 'bower', ->
	jsFiles = filter('*.js', restore: true)
	fontsFiles = filter('*.+(woff|ttf|woff2)', restore: true)
	cssFiles = filter('*.css', restore: true)
	gulp.src(bower(paths: paths.bower)).pipe(jsFiles).pipe(gulp.dest(destPaths.scripts)).pipe(jsFiles.restore).pipe(fontsFiles).pipe(gulp.dest(destPaths.fonts)).pipe(fontsFiles.restore).pipe(cssFiles).pipe(gulp.dest(destPaths.styles)).pipe cssFiles.restore
