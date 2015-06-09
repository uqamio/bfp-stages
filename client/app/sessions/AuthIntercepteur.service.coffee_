baseApp = angular.module 'baseApp'
baseApp.factory('AuthIntercepteur',
  ($rootScope, $q, $window) ->
    obj =
      request: (config) ->
        config.headers = config.headers || {};
        if ($window.sessionStorage.token)
          config.headers.Authorization = 'Bearer ' + $window.sessionStorage.token;
        config;
      response: (response) ->
        ## if (response.status === 401)
        response || $q.when(response);

    return obj
)
