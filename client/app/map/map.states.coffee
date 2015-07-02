baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'map',
    url: '/map',
    templateUrl: 'app/map/index.html',
    controller: 'MapController',
    animation:
      enter: 'fadein'