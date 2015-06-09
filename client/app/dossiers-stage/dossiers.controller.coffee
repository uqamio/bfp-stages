baseApp = angular.module 'baseApp'

DossierController = ($scope) ->
  $scope.dossiers = [
    {
      nom: 'Gabriel Com',
      programme: 'GTI',
      codePermanent: 'COMG03107901',
      cote: 3.47
    },
    {
      nom: 'Caroline Germain',
      programme: 'Gestion',
      codePermanent: 'ABCD03021524',
      cote: 4.29
    },
    {
      nom: 'Annie Pelletier',
      programme: 'Bacc. Administration des affaires',
      codePermanent: 'PELA02010506',
      cote: 2.7
    },
    {
      nom: 'Steve Wozniak',
      programme: 'School dropout',
      codePermanent: 'IMAC01234567',
      cote: 1.45
    },
    {
      nom: 'Jasque Cartier',
      programme: 'Titanic',
      codePermanent: 'SOSI11000111',
      warning: true,
      cote: 2.45
    }

  ]
  $scope.setDossier = (dossier)->
    $scope.dossierSelectionne = dossier



DossierController.$inject = ['$scope']

baseApp.controller('DossierController', DossierController)