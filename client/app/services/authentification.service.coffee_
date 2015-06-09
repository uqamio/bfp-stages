baseApp = angular.module 'baseApp'

baseApp.factory('Authentification',
  ($window) ->
    obj =
      estAuthentifie: () ->
        ($window.sessionStorage.token) ? true: false;

    setToken: (token) ->
      $window.sessionStorage.token = token;
    obj
)