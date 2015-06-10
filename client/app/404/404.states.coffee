baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'introuvable',
    url: '/introuvable',
    templateUrl: 'app/404/index.html'