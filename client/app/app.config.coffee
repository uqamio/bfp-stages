baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $urlRouterProvider.otherwise '/introuvable'
  $locationProvider.html5Mode({
    enabled: false,
    requireBase: false
  })