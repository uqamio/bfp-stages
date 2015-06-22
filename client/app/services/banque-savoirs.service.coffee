baseApp = angular.module 'baseApp'

baseApp.factory 'BanqueSavoir', ['$http', ($http) ->
  new class BanqueSavoir
    constructor: ->

    creerEtablissement: (newEtablissement)->
      $http ( {
        method: 'PUT',
        url: '/api/banque-savoir/etablissements',
        data: newEtablissement
      })

    getEtablissement: (id) ->
      $http ( {
        method: 'GET',
        url: '/api/banque-savoir/etablissements/' + id
      })

    supprimerEtablissement: (id) ->
      $http ( {
        method: 'DELETE',
        url: '/api/banque-savoir/etablissements/' + id
      })

    getEtablissements: ->
      $http ( {
        method: 'GET',
        url: '/api/banque-savoir/etablissements'
      })

    getMockEtablissements: ->
      [
        {
          id: 1,
          nom: 'CSDM',
          description: 'Desc.',
          courriel: 'csdm@csdm.ca',
          coordonnees: '1234, Rue Ici. Montréal Québec. Canada H0H 0H0',
          type: 'Commission scolaire',
          notes: [],
          test: 'toto',
        },
        {
          id: 2,
          nom: 'Calixa-Lavallée',
          description: 'Desc.',
          courriel: 'calix@csdm.ca',
          coordonnees: '4589, Rue Labat. Kuujjuaq Québec. Canada J5L 8I9 0H0',
          type: 'Établissement d\'enseignement',
          test: 'privé',
          codeEthnique: 'CN',
          commissionScolaire: 1,
          langueEnseignement: ['fr', 'en'],
          effectifScolaire: 'son effectif',
          typeFormation: 'secondaire',
          repondants: [
            {nom: 'Le Directeur', telephone: '514-555-6666, 1234', courriel: 'abc.dir@uqam.ca'},
            {nom: 'Le Prof', telephone: '514-666-7777, 4567', courriel: 'abc.prof@uqam.ca'}
          ],
          notes: [
            {id: 1, auteur: 'Gabriel Com', texte: 'Le texte de la note 1', date: new Date()},
            {id: 2, auteur: 'Gabriel Com', texte: 'Le texte de la note 2', date: new Date()},
            {id: 3, auteur: 'Gabriel Com', texte: 'Le texte de la note 3', date: new Date()},
          ]
        },
        {
          id: 3,
          nom: 'Marie-Victorin',
          description: 'Desc.',
          courriel: 'marie-vic@longueuil.ca',
          coordonnees: '34, Boulevard Lévesque. Québec Québec. Canada J20 6K4 0H0',
          type: 'Commission scolaire',
          test: 'public',
          notes: []
        },
        {
          id: 4,
          nom: 'CGI',
          description: 'Desc.',
          courriel: 'pot-de-vin@cgi.ca',
          coordonnees: '3456, Avenue Bienvenue. Kuujjuaq Québec. Canada H0H 0H0',
          type: 'Entreprise',
          test: 'privé',
          siegeSocial: 'Montréal',
          notes: []
        }
      ]
]