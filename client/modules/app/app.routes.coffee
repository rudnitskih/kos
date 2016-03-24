angular.module("rApp").config ($stateProvider, $locationProvider, $urlRouterProvider) ->
	viewsPath = "./html/modules/views/"

	$stateProvider
		.state "r",
			url: ""
			abstract: true
			templateUrl: "#{viewsPath}main/main.html"

		.state "r.about",
			url: "/"
			templateUrl: "#{viewsPath}about/about.html"
			controller: "rAboutController as $ctrl"

		.state "r.lections",
			url: "/lections/:id"
			templateUrl: "#{viewsPath}lections/lections.html"
			controller: "rLectionsController as $ctrl"
			params:
				id: 
					value: "1"
		
		.state "r.prezi",
			url: "/prezi"
			templateUrl: "#{viewsPath}prezi/prezi.html"
			controller: "rPreziController as $ctrl"

		.state "r.quiz",
			url: "/quiz"
			templateUrl: "#{viewsPath}quiz/quiz.html"
			controller: "rQuizController as $ctrl"

	$locationProvider.html5Mode
		enabled: true
