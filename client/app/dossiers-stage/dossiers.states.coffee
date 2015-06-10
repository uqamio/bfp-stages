baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'dossiers-stage',
    url: '/dossiers-stage',
    templateUrl: 'app/dossiers-stage/index.html',
    controller: 'DossierController'
    animation:
      enter: 'fadeIn'
