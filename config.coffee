env = require('node-env-file')
pjson = require('./package.json')
env './.env'
module.exports =
	dbURI: 'mongodb://' + process.env.BD_USER + ':' + process.env.BD_PASS + '@ds023078.mlab.com:23078/smart-routes'
	uticketURL: 'https://' + process.env.U_LOGIN + ':' + process.env.U_PASSWORD + '@sandbox-api.t2t.in.ua'
	geocodeURL: '//maps.googleapis.com/maps/api/geocode/json?<%= parameters %>&key=' + process.env.GOOGLE_API_KEY
	scripts: [
		'lodash'
		'jquery'
		'angular'
		'angular-animate'
		'angular-aria'
		'angular-material'
		'angular-resource'
		'angular-ui-router'
		'angular-resource'
		'angular-simple-logger'
		'angular-google-maps'
		'md-data-table'
		'loading-bar'
		pjson.name
	]
	styles: [
		'loading-bar'
		'angular-material'
		pjson.name
	]
	paths:
		src:
			root: './client'
			jade: [
				'./client/**/*.jade'
			]
			index: './client/index.jade'
			scripts: './client/modules/**/*.coffee'
			stylus: [
				'client/**/*.styl'
				'!client/vendors'
			]
			sass: [
				'client/**/*.scss'
				'!client/vendors/**/*.scss'
			]
			css: [
				'client/**/*.css'
				'!client/vendors/**/*.css'
			]
		dest:
			root: './public'
			styles: './public/styles'
			scripts: './public/scripts'
			fonts: './public/fonts'
			html: './public/html'
		bower:
			bowerDirectory: './client/vendors'
			bowerrc: './.bowerrc'
			bowerJson: './bower.json'
		server: main: 'server/app.coffee'