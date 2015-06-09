baseApp = angular.module 'baseApp'

baseApp.factory 'BanqueSavoir', ['$http', ($http) ->
  new class BanqueSavoir
    constructor: ->

    getPersonneRessources: ->
      [
        {nom: 'Com', prenom: 'Gabriel', courriel: 'com.gabriel@uqam.ca'},
        {nom: 'Germain', prenom: 'Caroline', courriel: 'germain.caroline@uqam.ca'},
      ]
]