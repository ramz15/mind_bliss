if gon.logged_in
  @mindbliss = angular.module("mindbliss", [
  	# "ngResource"
  	"ngRoute"
  	"mindblissServices"
  ])


  # setup angular routes 
  @mindbliss.config(['$routeProvider', ($routeProvider) ->
    $routeProvider.
      when('/sendlove_reply', {
        templateUrl: '/templates/sendlove_reply.html',
        controller: 'ReplyCtrl'
      }).
      otherwise({
        templateUrl: '/templates/sendlove_reply.html',
        controller: 'ReplyCtrl'
        # templateUrl: '/templates/home.html',
        # controller: 'HomeCtrl'
      }) 
  ])

  # set CSRF headers
  @mindbliss.config ["$httpProvider", ($httpProvider) ->
    csrfToken = angular.element(document).find('meta[name=csrf-token]').attr('content')
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = csrfToken
  ]


