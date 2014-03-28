var videocatControllers = angular.module('videocatControllers', []);

// Controller for videoDetail
videocatControllers.controller('videoDetailController', [ '$scope', '$http',
		'mySharedService', function($scope, $http, sharedService) {
			$scope.$on('handleBroadcast', function() {
				$scope.video = sharedService.video;
			});
			$scope.video = sharedService.video;
			$scope.test = "bla";
		} ]);

videocatControllers.controller('VideoListCtrl', [ '$scope', '$http',
		function($scope, $http) {
			$http.get('videosFiles/videos.json').success(function(data) {
				$scope.videos = data;
			});

			$scope.orderProp = 'age';
		} ]);

videocatControllers.controller('VideoDetailCtrl', [ '$scope', '$routeParams',
		function($scope, $routeParams) {
			$scope.videoId = $routeParams.videoId;
		} ]);

videocatControllers.config([ '$routeProvider', function($routeProvider) {
	$routeProvider
	.when('/videolist', {
		templateUrl : 'videosView/partials/videoList.html',
		controller : 'VideoListCtrl'
	}).when('/videos/:videoId', {
		templateUrl : 'videosView/partials/videoDetail.html',
		controller : 'VideoDetailCtrl'
	}).otherwise({
		redirectTo : 'partials/error.html'
	});
} ]);