baseApp = angular.module "baseApp"

baseApp.filter 'cmdate', ['$filter', ($filter) ->
  (input, format) ->
    $filter('date')(new Date(input), format);
]