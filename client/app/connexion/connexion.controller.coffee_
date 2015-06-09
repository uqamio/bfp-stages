baseApp = angular.module 'baseApp'

ConnexionController = ($scope, $http, $window) ->
  $scope.connecter = ()->
    $http.post('/authentification', {})
    .success((data, status, headers, config) ->
      $window.sessionStorage.token = data.token
      console.log('token', $window.sessionStorage.token)
      $scope.message = 'Welcome'
    )
    .error((data, status, headers, config) ->
      # Erase the token if the user fails to log in
      delete $window.sessionStorage.token
      # Handle login errors here
      $scope.message = 'Error: Invalid user or password'
    )

ConnexionController.$inject = ['$scope', '$http', '$window', '$routeParams', 'Authentification']
baseApp.controller('ConnexionController', ConnexionController)