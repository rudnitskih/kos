angular
	.module("rResources")
	.factory "rRouteResource", ($resource) ->
		$resource "api/routes/:id", {}