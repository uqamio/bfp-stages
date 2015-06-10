baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'accueil',
    url: '/',
    templateUrl: 'app/accueil/index.html',
    animation:
      enter: 'fadein'