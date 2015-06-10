baseApp = angular.module 'baseApp'

EtablissementController = ($scope, $stateParams, BanqueSavoir, FoundationApi) ->
  $scope.id = 'Id : ' + $stateParams.id
  $scope.etablissement = BanqueSavoir.getEtablissement parseInt $stateParams.id

EtablissementController.$inject = ['$scope', '$stateParams', 'BanqueSavoir', 'FoundationApi']
baseApp.controller('EtablissementController', EtablissementController)