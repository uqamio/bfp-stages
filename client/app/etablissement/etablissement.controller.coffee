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
      $state.go('banque-savoirs')
    promise.error (data, status) ->
      console.warn data

  $scope.modifier = (id) ->
    console.log $scope.etablissement
    promise = BanqueSavoir.modifierEtablissement $scope.etablissement
    promise.success (data, status) ->
      console.log data
      FoundationApi.publish('main-notifications', {
        title: 'Test',
        content: 'Test2',
        color: 'success',
        autoclose:'3000'
      });
    promise.error (data, status) ->
      console.warn data

  $scope.ajouterNote = () ->
    $scope.etablissement.notes.push({
      texte: $scope.newNote.texte,
      type: $scope.newNote.type,
      date: new Date(),
      auteur: 'Gabriel Com'
    })
    delete $scope.newNote

EtablissementController.$inject = ['$scope', '$state', '$stateParams', 'BanqueSavoir', 'FoundationApi']
baseApp.controller('EtablissementController', EtablissementController)