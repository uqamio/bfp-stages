baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'banque-savoirs',
    url: '/banque-savoirs',
    controller: 'BanqueController'
    templateUrl: 'app/banque/index.html',
    animation:
      enter: 'fadeIn'