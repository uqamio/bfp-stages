baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'accueil',
    url: '/',
    templateUrl: 'app/accueil/index.html',
    animation:
      enter: 'fadein',
      leave: 'slideOutRight'

  $stateProvider.state 'dossiers-stage',
    url: '/dossiers-stage',
    templateUrl: 'app/dossiers-stage/index.html',
    controller: 'DossierController'
    animation:
      enter: 'slideInRight',
      leave: 'slideOutRight'


  $stateProvider.state 'banque-savoirs',
    url: '/banque-savoirs',
    controller: 'BanqueController'
    templateUrl: 'app/banque/index.html'

  $stateProvider.state 'banque-personnes-ressources',
    url: '/banque-personnes-ressources',
    controller: 'BanqueController'
    templateUrl: 'app/banque/personnes.html',

  $urlRouterProvider.otherwise '/'
  $locationProvider.html5Mode({
    enabled: false,
    requireBase: false
  })