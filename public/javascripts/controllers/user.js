'use strict';

function UserCtrl ($scope, UsersService) {

	$scope.getTasks = function () {
		$scope.tasks = UsersService.userTasks({login: 'task_hero'});
	};

	$scope.getLists = function () {
		$scope.lists = UsersService.userLists({login: 'task_hero'});
	};

	$scope.tasks = $scope.getTasks();
	$scope.lists = $scope.getLists();
}