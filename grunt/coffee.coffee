module.exports = {
  client: {
    expand: true,
    cwd: '<%= repertoires.client %>app/',
    src: ['**/*.coffee'],
    dest: '<%= repertoires.distribution %>public/scripts',
    ext: '.js'
  },
  serveur: {
    expand: true,
    cwd: '<%= repertoires.serveur %>',
    src: ['**/*.coffee'],
    dest: '<%= repertoires.distribution %>',
    ext: '.js'
  }
}