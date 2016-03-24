angular
	.module("rViews")
	.controller "rPreziController", ($scope, $element, $sce, $rootScope, $timeout) ->
		ratio = 16 / 9
		$scope.prezi = {}
		containerWidth = $element.width() - 20
		containerHeight = $element.height() - 20

		setIframeOptions = ->  
			if containerWidth > containerHeight
				$scope.prezi.height = containerHeight
				$scope.prezi.width = Math.round containerHeight * ratio
			else
				$scope.prezi.width = containerWidth
				$scope.prezi.height = Math.round containerWidth / ratio

			$scope.prezi.src = $sce.trustAsResourceUrl "https://prezi.com/embed/-jse08aow99f/?bgcolor=ffffff&amp;lock_to_path=0&amp;autoplay=0&amp;autohide_ctrls=0&amp;landing_data=bHVZZmNaNDBIWnNjdEVENDRhZDFNZGNIUE43MHdLNWpsdFJLb2ZHanI0MjgwbDI2NlBVMGsxeEVTSHpkN0tSV213PT0&amp;landing_sign=aYqDDzE8Kg5-R-W_2En8x3SwQbpx5LjDg2C3xHlHEQ8"
		
		setIframeOptions()