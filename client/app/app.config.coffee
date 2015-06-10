baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'accueil',
    url: '/',
    templateUrl: 'app/accueil/index.html',
    animation:
      enter: 'fadein',
      leave: 'slideOutRight'

  $stateProvider.state 'introuvable',
    url: '/introuvable',
    templateUrl: 'app/404/index.html'

  $urlRouterProvider.otherwise '/introuvable'
  $locationProvider.html5Mode({
    enabled: false,
    requireBase: false
  })