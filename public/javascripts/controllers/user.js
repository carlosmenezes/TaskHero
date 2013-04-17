'use strict';

function UserCtrl ($scope, UsersService) {

	$scope.getTasks = function () {
		$scope.tasks = UsersService.userTasks({login: 'task_hero'});
		console.log($scope.tasks);
	};

	$scope.getLists = function () {
		$scope.lists = UsersService.userLists({login: 'task_hero'});
	};

	$scope.tasks = $scope.getTasks();
	$scope.lists = $scope.getLists();
	console.log($scope.tasks);
}