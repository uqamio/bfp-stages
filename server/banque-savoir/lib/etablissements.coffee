util = require 'util'

mongoose = require 'mongoose'

mongoose.connect 'mongodb://banque:!QAWS@morpheus.uqam.ca:32768/banque'
db = mongoose.connection
Schema = mongoose.Schema

db.on 'error', console.error.bind console, 'connection error:'

db.once 'open', () ->
  console.log "mongodb is opened"

RepondantSchema = new Schema(
  {
    name: String,
    prenom: String,
    courriel: String
  }
);

AbstractEtablissementSchema = () ->
  Schema.apply this, arguments
  this.add({
    nom: String,
    courriel: String,
    coordonnees: String,
    creeLe: {type: Date, default: Date.nom},
    modifieLe: {type: Date, default: Date.nom},
    notes: [String],
    regionAdministrative: Schema.Types.ObjectId,
    repondants: [RepondantSchema]
  })

util.inherits(AbstractEtablissementSchema, Schema);


EtablissementSchema = new AbstractEtablissementSchema();

EnseignementSchema = new AbstractEtablissementSchema {
  directeur: String
}

CommissionScolaireSchema = new AbstractEtablissementSchema {
  regionAdministrative: String
}

Etablissement = mongoose.model 'Etablissement', EtablissementSchema
Enseignement = Etablissement.discriminator 'Enseignement', EnseignementSchema
CommissionScolaire = Etablissement.discriminator 'CommissionScolaire', CommissionScolaireSchema

internal =
  models:
    Enseignement: Enseignement,
    CommissionScolaire: CommissionScolaire,
  creerEtablissementEnseignement: (etablissement, callback) ->
    Enseignement.create etablissement, (err, entablissementEnseignement) ->
      if (err)
        callback err
      else
        callback null, entablissementEnseignement
  getEtablissement: (id, callback) ->
    Etablissement.findById id,
      (err, etablissement) ->
        if (!err)
          callback null, etablissement
        else
          callback err
  supprimerEtablissement: (id, callback) ->
    Etablissement.remove {_id: id},
      (err) ->
        if (!err)
          callback null
        else
          callback err
  getEtablissements: (callback) ->
    Enseignement.find {},
      (err, enseignements) ->
        if (!err)
          callback null, enseignements
        else
          callback err


module.exports = internal