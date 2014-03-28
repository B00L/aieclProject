var angularJSApp = angular.module('angularJSApp', ['videocatControllers','videoAdminControllers']);

angularJSApp.factory('mySharedService', function($rootScope) {
    var sharedService = {};
    
    sharedService.video = {};

    sharedService.prepForBroadcast = function(video) {
        this.video = video;
        this.broadcastItem();
    };

    sharedService.broadcastItem = function() {
        $rootScope.$broadcast('handleBroadcast');
    };

    return sharedService;
});

/*angularJSApp.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
            when('/aieclVideoProject/protected/videos/', {
                templateUrl: '/aieclVideoProject/protected/videos/videos.jsp',
                controller: 'videosController'
            }).
            when('/aieclVideoProject/protected/videos/:videoId', {
                templateUrl: '/aieclVideoProject/protected/videos/videoDetail.jsp',
                controller: 'videoDetailController'
            }).
            otherwise({
                redirectTo: '/aieclVideoProject/protected/welcomePage.jsp'
            });
}]);*/