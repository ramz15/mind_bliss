@mindbliss = angular.module("mindbliss", [
	# "ngResource"
	"ngRoute"
	"mindblissServices"
])

@mindbliss.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    otherwise({
      templateUrl: '/templates/home.html.erb',
      controller: 'HomeCtrl'
    }) 
])

# set CSRF headers
@mindbliss.config ["$httpProvider", ($httpProvider) ->
  csrfToken = angular.element(document).find('meta[name=csrf-token]').attr('content')
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken
]

