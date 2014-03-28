var videocatControllers = angular.module('videocatControllers', []);

//Controller for videoDetail
videocatControllers.controller('videoDetailController', ['$scope', '$http', 'mySharedService', function($scope, $http, sharedService) {
    $scope.$on('handleBroadcast', function() {
        $scope.video = sharedService.video;
    });
    $scope.video = sharedService.video;
    $scope.test ="bla";
}]);