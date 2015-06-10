baseApp = angular.module 'baseApp'

baseApp.factory 'BanqueSavoir', ['$http', ($http) ->
  new class BanqueSavoir
    constructor: ->

    getPersonneRessources: ->
      [
        {nom: 'Com', prenom: 'Gabriel', courriel: 'com.gabriel@uqam.ca'},
        {nom: 'Germain', prenom: 'Caroline', courriel: 'germain.caroline@uqam.ca'},
      ]

    getListes: ->
      [
        {id: 1, nom: 'Personnes ressources', description: 'La liste des personnes ressources'},
        {id: 2, nom: 'Commissions scolaires', description: 'La liste des commissions scolaires pour l\'ensemble des '},
      ]
]