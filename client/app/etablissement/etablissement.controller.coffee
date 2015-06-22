baseApp = angular.module 'baseApp'

EtablissementController = ($scope, $state, $stateParams, BanqueSavoir, FoundationApi) ->
  #BanqueSavoir.getEtablissements((etablissements))
  getEtablissementPromise = BanqueSavoir.getEtablissement $stateParams.id

  getEtablissementPromise.success (data, status) ->
    $scope.etablissement = data
  getEtablissementPromise.error (data, status) ->

  $scope.supprimer = (id) ->
    promise = BanqueSavoir.supprimerEtablissement id
    promise.success (data, status) ->
      console.log data
      $state.go('banque-savoirs')
    promise.error (data, status) ->
      console.warn data

EtablissementController.$inject = ['$scope', '$state', '$stateParams', 'BanqueSavoir', 'FoundationApi']
baseApp.controller('EtablissementController', EtablissementController)