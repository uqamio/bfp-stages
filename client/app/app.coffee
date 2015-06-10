root = exports ? this
root.foundationRoutes = -> []

app = angular.module 'baseApp', ['ui.router',
                                 'ngAnimate',
                                 'foundation',
                                 'foundation.dynamicRouting',
                                 'foundation.dynamicRouting.animations']

app.controller 'BaseController', ($scope)->
  $scope.notification = 4