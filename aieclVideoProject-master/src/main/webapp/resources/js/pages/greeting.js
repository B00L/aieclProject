function Greeting($scope, $http) {
    $http.get('/aieclVideoProject/protected/videos/greeting').
        success(function(data) {
            $scope.greeting = data;
        });
}