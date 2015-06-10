baseApp = angular.module 'baseApp'

baseApp.factory 'BanqueSavoir', ['$http', ($http) ->
  new class BanqueSavoir
    constructor: ->

    getPersonneRessources: ->
      [
        {nom: 'Com', prenom: 'Gabriel', courriel: 'com.gabriel@uqam.ca'},
        {nom: 'Germain', prenom: 'Caroline', courriel: 'germain.caroline@uqam.ca'},
      ]

    getEtablissement: (id) ->
      etablissement for etablissement in this.getEtablissements() when etablissement.id is id
      etablissement

    getEtablissements: ->
      [
        {
          id: 1,
          nom: 'CSDM',
          description: 'Desc.',
          type: 'Commission scolaire'
        },
        {
          id: 2,
          nom: 'Calixa-Lavallée',
          description: 'Desc.',
          type: 'Établissement d\'enseignement'
        },
        {
          id: 3,
          nom: 'Marie-Victorin',
          description: 'Desc.',
          type: 'Commission scolaire'
        },
        {
          id: 4,
          nom: 'CGI',
          description: 'Desc.',
          type: 'Entreprise'
        }
      ]
]