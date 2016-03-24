angular
	.module("rApp")
	.controller "rAppController", ($scope) ->
		$scope.navBarItems = [
			{
				label: "Про программу",
				state: "r.about"
			}
			{
				label: "Учбовий матеріал",
				state: "r.lections"
			}
			{
				label: "Презентація",
				state: "r.prezi"
			}
			{
				label: "Виконати тести",
				state: "r.quiz"
			}
		]
			
