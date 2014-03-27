var videocatControllers = angular.module('videocatControllers', []);

videocatControllers.controller('videosController', ['$scope', '$http', function($scope, $http) {
	$scope.pageToGet = 0;

	$scope.state = 'busy';

	$scope.lastAction = '';

	$scope.url = "/aieclVideoProject/protected/videos/";

	$scope.errorOnSubmit = false;
	$scope.errorIllegalAccess = false;
	$scope.displayMessageToUser = false;
	$scope.displayValidationError = false;
	$scope.displaySearchMessage = false;
	$scope.displaySearchButton = false;
	$scope.displayCreateVideoButton = false;

	$scope.video = {};

	$scope.searchFor = "";

	$scope.getVideoList = function() {
		var url = $scope.url;
		$scope.lastAction = 'list';

		$scope.startDialogAjaxRequest();

		var config = {
			params : {
				page : $scope.pageToGet
			}
		};

		$http.get(url, config).success(function(data) {
			$scope.finishAjaxCallOnSuccess(data, null, false);
		}).error(function() {
			$scope.state = 'error';
			$scope.displayCreateVideoButton = false;
		});
	};

	$scope.populateTable = function(data) {
		if (data.pagesCount > 0) {
			$scope.state = 'list';

			$scope.page = {
				source : data.videos,
				currentPage : $scope.pageToGet,
				pagesCount : data.pagesCount,
				totalVideos : data.totalVideos
			};

			if ($scope.page.pagesCount <= $scope.page.currentPage) {
				$scope.pageToGet = $scope.page.pagesCount - 1;
				$scope.page.currentPage = $scope.page.pagesCount - 1;
			}

			$scope.displayCreateVideoButton = true;
			$scope.displaySearchButton = true;
		} else {
			$scope.state = 'noresult';
			$scope.displayCreateVideoButton = true;

			if (!$scope.searchFor) {
				$scope.displaySearchButton = false;
			}
		}

		if (data.actionMessage || data.searchMessage) {
			$scope.displayMessageToUser = $scope.lastAction != 'search';

			$scope.page.actionMessage = data.actionMessage;
			$scope.page.searchMessage = data.searchMessage;
		} else {
			$scope.displayMessageToUser = false;
		}
	};

	$scope.changePage = function(page) {
		$scope.pageToGet = page;

		if ($scope.searchFor) {
			$scope.search($scope.searchFor, true);
		} else {
			$scope.getVideoList();
		}
	};

	$scope.exit = function(modalId) {
		$(modalId).modal('hide');

		$scope.video = {};
		$scope.errorOnSubmit = false;
		$scope.errorIllegalAccess = false;
		$scope.displayValidationError = false;
	};

	$scope.finishAjaxCallOnSuccess = function(data, modalId, isPagination) {
		$scope.populateTable(data);
		$("#loadingModal").modal('hide');

		if (!isPagination) {
			if (modalId) {
				$scope.exit(modalId);
			}
		}

		$scope.lastAction = '';
	};

	$scope.startDialogAjaxRequest = function() {
		$scope.displayValidationError = false;
		$("#loadingModal").modal('show');
		$scope.previousState = $scope.state;
		$scope.state = 'busy';
	};

	$scope.handleErrorInDialogs = function(status) {
		$("#loadingModal").modal('hide');
		$scope.state = $scope.previousState;

		// illegal access
		if (status == 403) {
			$scope.errorIllegalAccess = true;
			return;
		}

		$scope.errorOnSubmit = true;
		$scope.lastAction = '';
	};

	$scope.addSearchParametersIfNeeded = function(config, isPagination) {
		if (!config.params) {
			config.params = {};
		}

		config.params.page = $scope.pageToGet;

		if ($scope.searchFor) {
			config.params.searchFor = $scope.searchFor;
		}
	};

	$scope.resetVideo = function() {
		$scope.video = {};
	};

	$scope.createVideo = function(newVideoForm) {
		if (!newVideoForm.$valid) {
			$scope.displayValidationError = true;
			return;
		}

		$scope.lastAction = 'create';

		var url = $scope.url;

		var config = {
			headers : {
				'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
			}
		};

		$scope.addSearchParametersIfNeeded(config, false);

		$scope.startDialogAjaxRequest();

		$http.post(url, $.param($scope.video), config).success(function(data) {
			$scope.finishAjaxCallOnSuccess(data, "#addVideosModal", false);
		}).error(function(data, status, headers, config) {
			$scope.handleErrorInDialogs(status);
		});
	};

	$scope.selectedVideo = function(video) {
		var selectedVideo = angular.copy(video);
		$scope.video = selectedVideo;
	};

	$scope.updateVideo = function(updateVideoForm) {
		if (!updateVideoForm.$valid) {
			$scope.displayValidationError = true;
			return;
		}

		$scope.lastAction = 'update';

		var url = $scope.url + $scope.video.id;

		$scope.startDialogAjaxRequest();

		var config = {};
		$scope.addSearchParametersIfNeeded(config, false);

		$http.put(url, $scope.video, config).success(function(data) {
			$scope.finishAjaxCallOnSuccess(data, "#updateVideosModal", false);
		}).error(function(data, status, headers, config) {
			$scope.handleErrorInDialogs(status);
		});
	};

	$scope.searchVideo = function(searchVideoForm, isPagination) {
		if (!($scope.searchFor) && (!searchVideoForm.$valid)) {
			$scope.displayValidationError = true;
			return;
		}

		$scope.lastAction = 'search';

		var url = $scope.url + $scope.searchFor;

		$scope.startDialogAjaxRequest();

		var config = {};		
		$scope.addSearchParametersIfNeeded(config, isPagination);

		$http.get(url, config)
			.success(function(data) {
				$scope.finishAjaxCallOnSuccess(data, "#searchVideosModal",
					isPagination);
				$scope.displaySearchMessage = true;
			}).error(function(data, status, headers, config) {
				$scope.handleErrorInDialogs(status);
			});
	};

	$scope.deleteVideo = function() {
		$scope.lastAction = 'delete';

		var url = $scope.url + $scope.video.id;

		$scope.startDialogAjaxRequest();

		var config = {};		
		$scope.addSearchParametersIfNeeded(config, false);

		$http.delete(url, config)
		.success(function(data) {
			$scope.resetVideo();
			$scope.finishAjaxCallOnSuccess(data, "#deleteVideosModal", false);
		}).error(function(data, status, headers, config) {
			$scope.handleErrorInDialogs(status);
		});
	};

	$scope.resetSearch = function() {
		$scope.searchFor = "";
		$scope.pageToGet = 0;
		$scope.getVideoList();
		$scope.displaySearchMessage = false;
	};

	$scope.getVideoList();
}]);
