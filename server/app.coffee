fs = require('fs')
path = require("path")
util = require('util')

express = require('express')
app = express()
cookieParser = require('cookie-parser')
session = require('express-session')
bodyParser = require('body-parser')
jwt = require('jsonwebtoken')

fondation = require('./fondation')
journalisation = fondation.journalisation


port = process.env.PORT || 2015
repertoirePublic = process.env.REPERTOIRE_PUBLIC || './public'
samelise = process.env.SAMLISE || false
secretClient = process.env.SECRET || 'UnPetitSecret_A_CHANGER_EN_PROD!!!!'


app.use(express.static(path.resolve(__dirname, repertoirePublic)));
app.use(cookieParser());
app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(bodyParser.json());
app.use(session({
  secret: 'On est open source.',
  resave: true,
  saveUninitialized: true
}))


if (samelise == 'true')
  passport = fondation.authentification.creerPassport()
  app.use(passport.initialize())
  app.use(passport.session())

  app.get('/connexion',
    passport.authenticate('saml', {
      failureRedirect: '/#/403'
    }),
    (req, res) ->
      res.end(201)
  )

  app.post('/authentification',
    passport.authenticate('saml', {
      failureRedirect: '/#/403',
      session: false
    }),
    (req, res) ->
      token = jwt.sign(req.user, secretClient, {expiresInMinutes: 60 * 5})
      res.redirect('/#/token/' + token)
  )

app.get('/tmptoken',
  (req, res) ->
    #Mapper les information SAML pour générer le token.
    utilisateur = {
      codeUQAM: 'gj123456',
      prenom: 'Prénom',
      nom: 'Nom',
      courriel: 'nom.prenom@uqam.ca'
    }
    token = jwt.sign(utilisateur, secretClient, {expiresInMinutes: 60 * 5});
    res.redirect('/#/token/' + token)
)

server = app.listen(port,
  ()->
    host = server.address().address;
    port = server.address().port;
    journalisation.info('On part le serveur! http://%s:%s.', host, port);
);
module.exports = app;