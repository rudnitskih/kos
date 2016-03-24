angular.module("rApp").run ($rootScope, $http, $animate) ->
	$rootScope.$on '$stateChangeStart', (event, toState, toParams) ->
		$animate.enabled(false)    
