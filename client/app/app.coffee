root = exports ? this
root.foundationRoutes = -> []

app = angular.module 'baseApp', ['ui.router',
                                 'ngAnimate',
                                 'foundation',
                                 'foundation.dynamicRouting',
                                 'foundation.dynamicRouting.animations']


BaseController = ($scope, FoundationApi)->
  $scope.onKeyPress = (e) ->
    if e.charCode == 181 && e.altKey
      FoundationApi.publish 'menu', 'toggle'


  $scope.notification = 4

BaseController.$inject = ['$scope', 'FoundationApi']
app.controller 'BaseController', BaseController
