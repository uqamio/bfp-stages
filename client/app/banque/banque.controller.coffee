baseApp = angular.module 'baseApp'

BanqueController = ($scope) ->
  $scope.hello = 'world !'

BanqueController.$inject = ['$scope']

baseApp.controller('BanqueController', BanqueController)