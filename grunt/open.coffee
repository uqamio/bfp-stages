module.exports = {
  dev: {
    path: 'http://localhost:2015'
  },
  debug: {
    path: 'http://127.0.0.1:8080/debug?port=5858'
  },
  coverage: {
    path: 'http://localhost:2015/coverage/lcov-report/index.html'
  },
  custom: {
    path: () ->
      return grunt.option('path')
  }
};