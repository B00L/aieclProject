function LocationController($scope, $location) {
    if ($location.$$absUrl.lastIndexOf('/videos') > 0){
        $scope.activeURL = 'videos';
    } else if($location.$$absUrl.lastIndexOf('/about')>0){
    	$scope.activeURL = 'about';
    } else {    
    	$scope.activeURL = 'home';
    }
}