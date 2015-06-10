baseApp = angular.module 'baseApp'

BanqueController = ($scope, BanqueSavoir, FoundationApi) ->
  $scope.personnes = BanqueSavoir.getPersonneRessources();
  $scope.listes = BanqueSavoir.getListes();

  $scope.setPersonne = (personne) ->
    $scope.currentPersonne = personne
  $scope.test = () ->
    FoundationApi.publish 'animatedModal', 'close'

BanqueController.$inject = ['$scope', 'BanqueSavoir', 'FoundationApi']

baseApp.controller('BanqueController', BanqueController)