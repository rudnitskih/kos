angular
	.module("rViews")
	.controller "rLectionsController", ($scope, $stateParams, $rootScope, $sce) ->
		$scope.menu = [
			{
				title: "1.Типизация компонентов обучающих программ."
				contentUrl: "0B0vwzY8BdehpZ3YzYUJ4X01uTUk"
			}
			{
				title: "2. Алгоритмы выполнения типовых операций."
				contentUrl: "0B0vwzY8BdehpVVdETno0cDVvLXM"
			}
			{
				title: "3. Технология разработки обучающих программ."
				contentUrl: "0B0vwzY8BdehpQTdBZDdwNVprZ0U"
			}
			{
				title: "4.Этапы проектирования, разработки и реализации обучающих программ на базе типовых элементов."
				contentUrl: "0B0vwzY8BdehpM1p2dThram5penc"
			}
			{
				title: "5. Методологические аспекты разработки компьютерных обучающих программ."
				contentUrl: "0B0vwzY8BdehpeEp0cTdIdlc1NWc"
			}
		]


		$scope.isActiveLink = ($index) ->
			$stateParams.id is ($index + 1).toString()

		getContentFile = (stateParams) ->
			url = $scope.menu[parseInt(stateParams.id)-1].contentUrl
			$sce.trustAsResourceUrl "https://docs.google.com/viewer?srcid=#{url}&pid=explorer&efh=false&a=v&chrome=false&embedded=true"

		
		offStateChengeSucess = $rootScope.$on "$stateChangeSuccess", (event, toState, toStateParams) ->
			$scope.contentFile = getContentFile toStateParams

		$scope.$on "$destroy", offStateChengeSucess
		
		$scope.contentFile = getContentFile $stateParams

