angular.module("rViews", ["rResources"]);

angular.module("rViews").controller("rPreziController", ["$scope", "$element", "$sce", "$rootScope", "$timeout", function($scope, $element, $sce, $rootScope, $timeout) {
  var containerHeight, containerWidth, ratio, setIframeOptions;
  ratio = 16 / 9;
  $scope.prezi = {};
  containerWidth = $element.width() - 20;
  containerHeight = $element.height() - 20;
  setIframeOptions = function() {
    if (containerWidth > containerHeight) {
      $scope.prezi.height = containerHeight;
      $scope.prezi.width = Math.round(containerHeight * ratio);
    } else {
      $scope.prezi.width = containerWidth;
      $scope.prezi.height = Math.round(containerWidth / ratio);
    }
    return $scope.prezi.src = $sce.trustAsResourceUrl("https://prezi.com/embed/-jse08aow99f/?bgcolor=ffffff&amp;lock_to_path=0&amp;autoplay=0&amp;autohide_ctrls=0&amp;landing_data=bHVZZmNaNDBIWnNjdEVENDRhZDFNZGNIUE43MHdLNWpsdFJLb2ZHanI0MjgwbDI2NlBVMGsxeEVTSHpkN0tSV213PT0&amp;landing_sign=aYqDDzE8Kg5-R-W_2En8x3SwQbpx5LjDg2C3xHlHEQ8");
  };
  return setIframeOptions();
}]);

angular.module("rViews").controller("rQuizController", ["$scope", function($scope) {}]);

angular.module("rViews").controller("rLectionsController", ["$scope", "$stateParams", "$rootScope", "$sce", function($scope, $stateParams, $rootScope, $sce) {
  var getContentFile, offStateChengeSucess;
  $scope.menu = [
    {
      title: "1.Типизация компонентов обучающих программ.",
      contentUrl: "0B0vwzY8BdehpZ3YzYUJ4X01uTUk"
    }, {
      title: "2. Алгоритмы выполнения типовых операций.",
      contentUrl: "0B0vwzY8BdehpVVdETno0cDVvLXM"
    }, {
      title: "3. Технология разработки обучающих программ.",
      contentUrl: "0B0vwzY8BdehpQTdBZDdwNVprZ0U"
    }, {
      title: "4.Этапы проектирования, разработки и реализации обучающих программ на базе типовых элементов.",
      contentUrl: "0B0vwzY8BdehpM1p2dThram5penc"
    }, {
      title: "5. Методологические аспекты разработки компьютерных обучающих программ.",
      contentUrl: "0B0vwzY8BdehpeEp0cTdIdlc1NWc"
    }
  ];
  $scope.isActiveLink = function($index) {
    return $stateParams.id === ($index + 1).toString();
  };
  getContentFile = function(stateParams) {
    var url;
    url = $scope.menu[parseInt(stateParams.id) - 1].contentUrl;
    return $sce.trustAsResourceUrl("https://docs.google.com/viewer?srcid=" + url + "&pid=explorer&efh=false&a=v&chrome=false&embedded=true");
  };
  offStateChengeSucess = $rootScope.$on("$stateChangeSuccess", function(event, toState, toStateParams) {
    return $scope.contentFile = getContentFile(toStateParams);
  });
  $scope.$on("$destroy", offStateChengeSucess);
  return $scope.contentFile = getContentFile($stateParams);
}]);

angular.module("rViews").controller("rAboutController", function() {});

angular.module("rResources", ["ngResource"]);

angular.module("rResources").factory("rStationResource", ["$resource", "$cacheFactory", function($resource, $cacheFactory) {
  var stationCache;
  stationCache = $cacheFactory('Station');
  return $resource("api/stations/:id", {}, {
    get: {
      cache: stationCache,
      method: 'get'
    }
  });
}]);

angular.module("rResources").factory("rRouteResource", ["$resource", function($resource) {
  return $resource("api/routes/:id", {});
}]);

angular.module("rComponents", []);

angular.module("rApp", ["angular-loading-bar", "ngMaterial", "ui.router", "rViews", "rComponents"]);

angular.module("rApp").run(["$rootScope", "$http", "$animate", function($rootScope, $http, $animate) {
  return $rootScope.$on('$stateChangeStart', function(event, toState, toParams) {
    return $animate.enabled(false);
  });
}]);

angular.module("rApp").config(["$stateProvider", "$locationProvider", "$urlRouterProvider", function($stateProvider, $locationProvider, $urlRouterProvider) {
  var viewsPath;
  viewsPath = "html/modules/views/";
  $stateProvider.state("r", {
    url: "",
    abstract: true,
    templateUrl: viewsPath + "main/main.html"
  }).state("r.about", {
    url: "/",
    templateUrl: viewsPath + "about/about.html",
    controller: "rAboutController as $ctrl"
  }).state("r.lections", {
    url: "/lections/:id",
    templateUrl: viewsPath + "lections/lections.html",
    controller: "rLectionsController as $ctrl",
    params: {
      id: {
        value: "1"
      }
    }
  }).state("r.prezi", {
    url: "/prezi",
    templateUrl: viewsPath + "prezi/prezi.html",
    controller: "rPreziController as $ctrl"
  }).state("r.quiz", {
    url: "/quiz",
    templateUrl: viewsPath + "quiz/quiz.html",
    controller: "rQuizController as $ctrl"
  });
  $urlRouterProvider.otherwise("/");
  return $locationProvider.html5Mode({
    enabled: true
  });
}]);

angular.module("rApp").controller("rAppController", ["$scope", function($scope) {
  return $scope.navBarItems = [
    {
      label: "Про программу",
      state: "r.about"
    }, {
      label: "Учбовий матеріал",
      state: "r.lections"
    }, {
      label: "Презентація",
      state: "r.prezi"
    }, {
      label: "Виконати тести",
      state: "r.quiz"
    }
  ];
}]);

angular.module("rApp").config(["$mdThemingProvider", function($mdThemingProvider) {}]);
