util = require 'util'

mongoose = require 'mongoose'

mongoose.connect 'mongodb://banque:!QAWS@morpheus.uqam.ca:32768/banque'
db = mongoose.connection
Schema = mongoose.Schema

db.on 'error', console.error.bind console, 'connection error:'

db.once 'open', () ->
  console.log "mongodb is opened"

RepondantSchema = new Schema {
  name: String,
  prenom: String,
  courriel: String
}


NoteSchema = new Schema {
  auteur: String,
  date: Date,
  texte: String,
  type: String,
  done: Boolean
}


BaseEtablissementSchema = () ->
  Schema.apply this, arguments
  this.add({
    nom: String,
    courriel: {type: String, default: ''},
    coordonnees: {type: String, default: ''},
    creeLe: {type: Date, default: Date.now},
    modifieLe: {type: Date, default: Date.now},
    notes: [NoteSchema],
    regionAdministrative: Schema.Types.ObjectId,
    repondants: [RepondantSchema]
  })

util.inherits(BaseEtablissementSchema, Schema);


EtablissementSchema = new BaseEtablissementSchema();

EnseignementSchema = new BaseEtablissementSchema
EnseignementSchema.add {
  directeur: String
}

CommissionScolaireSchema = new BaseEtablissementSchema
CommissionScolaireSchema.add {
  regionAdministrative:
    type: String, default: ''
}


Etablissement = mongoose.model 'Etablissement', EtablissementSchema
Enseignement = Etablissement.discriminator 'Enseignement', EnseignementSchema
CommissionScolaire = Etablissement.discriminator 'CommissionScolaire', CommissionScolaireSchema

internal =
  models:
    Enseignement: Enseignement,
    CommissionScolaire: CommissionScolaire,
  creerEtablissementEnseignement: (etablissement, callback) ->
    console.log etablissement
    fn = (err, raw) ->
      if (err)
        callback err
      else
        callback null, raw

    switch etablissement.type
      when 'CommissionScolaire' then CommissionScolaire.create etablissement, fn
      when 'Enseignement' then Enseignement.create etablissement, fn
  getEtablissement: (id, callback) ->
    Etablissement.findById id,
      (err, etablissement) ->
        if (!err)
          callback null, etablissement
        else
          callback err
  getEtablissements: (callback) ->
    Etablissement.find {},
      (err, enseignements) ->
        if (!err)
          callback null, enseignements
        else
          callback err
  modifierEtablissementEnseignement: (etablissement, callback) ->
    console.log etablissement
    Etablissement.update {
        _id: etablissement._id
      },
      {$set: etablissement},
      (err, raw) ->
        if (!err)
          callback null, raw
        else
          callback err
  supprimerEtablissement: (id, callback) ->
    Etablissement.remove {_id: id},
      (err) ->
        if (!err)
          callback null
        else
          callback err


module.exports = internal