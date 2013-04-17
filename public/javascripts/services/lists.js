'use strict';

taskHeroServices.
	factory('ListsService', function ($resource) {
		return $resource('list/:id/:noun', {}, {
			update: { method: 'PUT', params: { noun: 'edit' } },
			listTasks: { method: 'GET', params: { noun: 'tasks' }, isArray: true }
		});
	});