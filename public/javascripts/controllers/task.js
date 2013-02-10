'use strict';

function TaskCtrl ($scope, TasksService) {
	
	$scope.allTasks = [];

	$scope.getAllTasks = function () {
		$scope.allTasks = TasksService.query({taskId: 'all'});
	};

}

/*class @TaskCtrl
	constructor: (@$scope, @Task) ->
		@$scope.allTasks = [{ title: "test", description: "test", user: { name: "Carlos" } }]		

		@$scope.getAllTasks = () ->
			#@allTasks = @Task.query()		
			@$scope.allTasks = [{ title: "test2", description: "test2", user: { name: "Carlos" } }]

	#tasksFromUser: (login) ->

TaskCtrl.$inject = ['$scope', 'Task']*/