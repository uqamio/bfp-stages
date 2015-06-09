module.exports = {
  clientApp: {
    files: [
      {
        expand: true,
        cwd: '<%= repertoires.client %>',
        src: [
          'bower_components/**/*',
          '**/*.html',
          '*.ico'
        ],
        dest: '<%= repertoires.distribution %>public/'
      },
      {
        expand: true,
        cwd: '<%= repertoires.client %>assets',
        src: [
          'images/**/*{.png,.jpg}'
        ],
        dest: '<%= repertoires.distribution %>public/'
      },
      {
        expand: true,
        cwd: '<%= repertoires.client %>bower_components/foundation-apps/js/angular/components',
        src: '**/*',
        dest: '<%= repertoires.distribution %>public/components'
      },
      {
        expand: true,
        cwd: '<%= repertoires.client %>bower_components/foundation-apps/iconic',
        src: '*.svg',
        dest: '<%= repertoires.distribution %>public/assets/img/iconic'
      }
    ]
  }
};