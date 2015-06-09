module.exports =
{
  debugNWatch: {
    tasks: [
      'node-inspector',
      'watch'
    ],
    options: {
      logConcurrentOutput: true
    }
  },
  deployDev: {
    tasks: [
      'mocha_istanbul:coverage'
    ]
  }
}
