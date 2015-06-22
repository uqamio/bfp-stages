etablissements = require './lib/etablissements'

module.exports =
  etablissementMiddlewares:
    creerEtablissementEnseignement: (req, res) ->
      #on peut mettre des règles d'affaires ici.
      etablissements.creerEtablissementEnseignement req.body,
        (err, etablissementEndeignement) ->
          if(!err)
            res.json etablissementEndeignement
          else
            res.send 'NONNNN!!!!'
    modifierEtablissementEnseignement: (req, res) ->
      id = req.params.id
      etablissement = req.params.etablissement
      etablissements.modifierEtablissementEnseignement id, etablissement,
        (err, etablissementEndeignement) ->
          if(!err)
            res.json etablissementEndeignement
          else
            res.send 'NONNNN!!!!'
    supprimerEtablissement: (req, res) ->
      id = req.params.id
      etablissements.supprimerEtablissement id,
        (err) ->
          if(!err)
            res.send 'gone'
          else
            res.send 'NONNNN!!!!'
    getEtablissement: (req, res) ->
      id = req.params.id
      etablissements.getEtablissement id, (err, etablissement) ->
        if(!err)
          res.json etablissement
        else
          res.send 'NONNNN!!!!'
    getEtablissements: (req, res) ->
      etablissements.getEtablissements (err, etablissements) ->
        if(!err)
          res.json etablissements
        else
          res.send 'NONNNN!!!!'
