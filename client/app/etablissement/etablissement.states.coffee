baseApp = angular.module "baseApp"

baseApp.config ($urlRouterProvider, $locationProvider, $stateProvider) ->
  $stateProvider.state 'etablissement',
    url: '/etablissement/:id',
    animation:
      enter: 'fadeIn',
    views:
      "":
        templateUrl: 'app/etablissement/etablissement.html',
        controller: 'EtablissementController'