module.exports = {
  options: {
    livereload: true
  },
  css: {
    files: [
      '<%= repertoires.client %>**/*.scss'
    ],
    tasks: [
      'sass:dist'
    ]
  },
  html: {
    files: [
      '<%= repertoires.client %>**/*.html'
    ],
    tasks: [
      'build'
    ]
  },
  scripts: {
    files: [
      '<%= repertoires.client %>app/**/*.coffee'
    ],
    tasks: [
      'build'
    ]
  },
  serveur: {
    files: [
      '<%= repertoires.serveur %>**/*.coffee'],
    tasks: ['coffee', 'express:dev'],
    options: {
      spawn: false
    }
  }
};