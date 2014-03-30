function Featured($scope, $http) {
    $http.get('/aieclVideoProject/protected/videosAdmin/featured').
        success(function(data) {
            $scope.featured = data;
        });
}