# For more information see: http://emberjs.com/guides/routing/

TaskHero.Router.map ->
  @resource 'tasks'
  @resource 'lists'
  @resource 'users', ->
    @route 'usersLists', path: '/task_hero/lists'