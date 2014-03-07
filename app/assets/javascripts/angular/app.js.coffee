if gon.logged_in
  @mindbliss = angular.module("mindbliss", [
  	# "ngResource"
  	"ngRoute"
  	"mindblissServices"
    "ui.bootstrap"
  ])


  # setup angular routes 
  @mindbliss.config(['$routeProvider', ($routeProvider) ->
    $routeProvider.
      when('/reply', {
        templateUrl: '/templates/sendlove_reply.html',
        controller: 'ReplyCtrl'
      }).
      otherwise({
        templateUrl: '/templates/home.html',
        controller: 'HomeCtrl'
      }) 
  ])

  # set CSRF headers
  @mindbliss.config ["$httpProvider", ($httpProvider) ->
    csrfToken = angular.element(document).find('meta[name=csrf-token]').attr('content')
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken
  ]


