@mindbliss = angular.module("mindbliss", ["ngResource", "ngRoute"])

@mindbliss.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    otherwise({
      templateUrl: '../templates/home.html.erb',
      controller: 'HomeCtrl'
    }) 
])

@mindbliss.controller 'HomeCtrl', ['$scope', ($scope) ->
	$scope.user = gon.user
  $scope.templates =
    [ { name: 'gratitude', url: 'gratitude.html'}
    , { name: 'sendlove', url: 'sendlove.html'} 
  	, { name: 'meditation', url: 'meditation.html'}
  	, { name: 'workout', url: 'workout.html'}
  	, { name: 'positive', url: 'positive.html'}
  	, { name: 'social', url: 'social.html'}
  	, { name: 'dream', url: 'dream.html'}
  	, { name: 'loveall', url: 'loveall.html'}
  	, { name: 'creative', url: 'creative.html'}
  	, { name: 'confidence', url: 'confidence.html'}
  	, { name: 'health', url: 'health.html'}
  	, { name: 'music', url: 'music.html'}
  	, { name: 'laugh', url: 'laugh.html'}
  	, { name: 'compassion', url: 'compassion.html'}
  	, { name: 'forgive', url: 'forgive.html'} ]
  $scope.template = $scope.templates[0]
]
