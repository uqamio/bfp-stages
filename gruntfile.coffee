module.exports =
  (grunt) ->
    require('load-grunt-tasks') grunt

    require('load-grunt-config') grunt,
      {
        data: {
          repertoires: {
            client: 'client/',
            serveur: 'server/',
            distribution: 'dist/',
            test: 'tests/'
          }
        }
      }

    grunt.registerTask 'build',
      ['clean',
       'coffee',
       'copy',
       'injector',
       'wiredep']

    grunt.registerTask 'executerDev',
      ['env:dev',
       'express:dev',
       'open:dev',
       'watch']

    grunt.registerTask 'executerDebug',
      ['env:dev',
       'express:dev',
       'open:debug',
       'open:dev',
       'node-inspector']

    grunt.registerTask 'deployDev',
      ['clean',
       'coffee'
       'concurrent:deployDev',
       'sass:dist',
       'copy',
       'injector',
       'wiredep']

    grunt.registerTask 'deployProd',
      ['clean',
       'coffee'
       'sass:dist',
       'copy',
       'injector',
       'wiredep']

    grunt.registerTask 'serve',
      (target) ->
        if target == 'dev'
          grunt.task.run([
            'build',
            'sass:dist',
            'executerDev'])
        else
          console.warn('Aucune cible de trouvé dans le démarage de grunt pour : «%s»', target)


    grunt.registerTask('default', ['serve:dev'])
