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
      etablissement = null
      angular.forEach this.getEtablissements(), (value) ->
        if value.id is id
          etablissement = value
      etablissement

    getEtablissements: ->
      [
        {
          id: 1,
          nom: 'CSDM',
          description: 'Desc.',
          courriel: 'csdm@csdm.ca',
          coordonnees: '1234, Rue Ici. Montréal Québec. Canada H0H 0H0',
          type: 'Commission scolaire'
        },
        {
          id: 2,
          nom: 'Calixa-Lavallée',
          description: 'Desc.',
          courriel: 'calix@csdm.ca',
          coordonnees: '4589, Rue Labat. Kuujjuaq Québec. Canada J5L 8I9 0H0',
          type: 'Établissement d\'enseignement',
          codeEthnique: 'cn',
          commissionScolaire: 1,
          langueEnseignement: ['fr','en'],
          effectifScolaire:'son effectif',
          typeFormation: 'secondaire'
        },
        {
          id: 3,
          nom: 'Marie-Victorin',
          description: 'Desc.',
          courriel: 'marie-vic@longueuil.ca',
          coordonnees: '34, Boulevard Lévesque. Québec Québec. Canada J20 6K4 0H0',
          type: 'Commission scolaire'
        },
        {
          id: 4,
          nom: 'CGI',
          description: 'Desc.',
          courriel: 'pot-de-vin@cgi.ca',
          coordonnees: '3456, Avenue Bienvenue. Kuujjuaq Québec. Canada H0H 0H0',
          type: 'Entreprise',
          siegeSocial : 'Montréal'
        }
      ]
]