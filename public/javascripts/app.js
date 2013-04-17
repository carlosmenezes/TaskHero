'use strict';

angular.module('TaskHero', ['TasksHeroServices']).
	config(['$routeProvider', function ($routeProvider) {
		$routeProvider.
			when('/users/task_hero/tasks', { templateUrl: 'javascripts/partials/user/tasks.html', controller: UserCtrl }).
			otherwise({ redirectTo: '/users/task_hero/tasks' });
	}]);

this.taskHeroServices = angular.module('TasksHeroServices', ['ngResource']);

/*# App Module
#
# @abstract Description
#
angular.module('TaskHero', ['TasksService']).
	config ['$routeProvider', ($routeProvider) ->

	]
	# configuration handler*/