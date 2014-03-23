function LocationController($scope, $location) {
    if($location.$$absUrl.lastIndexOf('/contacts') > 0){
        $scope.activeURL = 'contacts';
    } else if ($location.$$absUrl.lastIndexOf('/videos') > 0){
        $scope.activeURL = 'videos';
    } else {
    	$scope.activeURL = 'home';
    }
}