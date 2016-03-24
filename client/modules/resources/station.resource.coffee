angular
	.module("rResources")
	.factory "rStationResource", ($resource, $cacheFactory) ->
		stationCache = $cacheFactory('Station')

		$resource "api/stations/:id", {},
			get:
				cache: stationCache
				method: 'get'