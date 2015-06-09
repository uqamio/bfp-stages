app = angular.module 'baseApp', ['ui.router'
                           'ui.router',
                           'ngAnimate',
                           'foundation']


app.controller 'BaseController', ($scope)->
  $scope.notification = 4