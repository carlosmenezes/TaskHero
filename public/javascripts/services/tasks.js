'use strict';

angular.module('TasksHeroServices', ['ngResource']).
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