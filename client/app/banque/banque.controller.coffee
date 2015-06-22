baseApp = angular.module 'baseApp'

BanqueController = ($scope,  $state, BanqueSavoir, FoundationApi) ->
  getEtablissements = ()->
    etablissementPromise = BanqueSavoir.getEtablissements()
    etablissementPromise.success((data, status) ->
      $scope.etablissements = data
    )
    etablissementPromise.error((data, status) ->
      console.warn arguments
    )

  getEtablissements()

  $scope.newEtablissement = {}

  $scope.creer = () ->
    p = BanqueSavoir.creerEtablissement($scope.newEtablissement)
    p.success (data, status)->
      $state.go('etablissement', { id: data._id })
      FoundationApi.publish 'etablissementModal', 'close'
    p.error (data, status)->




BanqueController.$inject = ['$scope', '$state', 'BanqueSavoir', 'FoundationApi']

baseApp.controller('BanqueController', BanqueController)