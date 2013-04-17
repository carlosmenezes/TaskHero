'use strict';

angular.module('TaskHero', ['TasksHeroServices']).
	config(['$routeProvider', function ($routeProvider) {
		
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