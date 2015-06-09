baseApp = angular.module 'baseApp'

AccueilController = ($scope) ->
  $scope.pop = ()->
    alert 'Pop'

AccueilController.$inject = ['$scope']

baseApp.controller('AccueilController', AccueilController)