function Featured($scope, $http) {
    $http.get('/aieclVideoProject/protected/videoView/featured').
        success(function(data) {
            $scope.featured = data;
        });
}