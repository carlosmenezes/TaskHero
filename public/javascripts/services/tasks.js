'use strict';

taskHeroServices.
	factory('TasksService', function ($resource) {
		return $resource('task/:taskId', {}, {
			update: { method: 'PUT' }
		});
	});

/*angular.module('TasksService', ['ngResource']).
	factory('Task', ($resource) ->
		$resource(
			'tasks/:task_id'
			{}
			{ 'update': { method: 'PUT' } }
		)
	)*/