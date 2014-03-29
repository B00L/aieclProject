function LocationController($scope, $location) {
    if ($location.$$absUrl.lastIndexOf('/videosAdmin') > 0){
        $scope.activeURL = 'videosAdmin';
    } else if ($location.$$absUrl.lastIndexOf('/about')>0){
    	$scope.activeURL = 'about';
    } else if ($location.$$absUrl.lastIndexOf('/videoView')>0){
    	$scope.activeURL = 'videoView';
    } else {    
    	$scope.activeURL = 'home';
    }
}