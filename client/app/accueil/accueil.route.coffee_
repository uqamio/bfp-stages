configuration =
  ($routeProvider) ->
    $routeProvider
    .when('/', {
        templateUrl: 'app/accueil/index.html',
        controller: 'AccueilController'
      })
    .when('/token/:token', {
        templateUrl: 'app/accueil/index.html',
        controller: 'AccueilController'
      });

configuration.$inject = ['$routeProvider']

(angular.module 'baseApp').config(configuration)