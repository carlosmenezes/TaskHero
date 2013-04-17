'use strict';

taskHeroServices.
	factory('UsersService', function ($resource) {
		return $resource('user/:login/:noun', {}, {
			update: { method: 'PUT', params: { noun: 'edit' } },
			userTasks: { method: 'GET', params: { noun: 'tasks' }, isArray: true },
			userLists: { method: 'GET', params: { noun: 'lists' }, isArray: true }
		});
	});