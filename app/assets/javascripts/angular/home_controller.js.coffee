if gon.logged_in
	@mindbliss.controller 'HomeCtrl', ['$scope', "Gratitude", "Brain", "Sendlove", "Dream", ($scope, Gratitude, Brain, Sendlove, Dream) ->
		# set $scope objects user and brain
		$scope.user = gon.user
		$scope.brain = gon.brain
		$scope.actionComplete = false

		# all action templates array
		$scope.templates =
			[ { name: 'gratitude', url: '/templates/gratitude.html', urlComplete: '/templates/gratitude_complete.html'}
			, { name: 'sendlove', url: '/templates/sendlove.html'} 
			, { name: 'dream', url: '/templates/dream.html'}
			# , { name: 'meditation', url: '/templates/meditation.html'}
			# , { name: 'workout', url: '/templates/workout.html'}
			# , { name: 'positive', url: '/templates/positive.html'}
			# , { name: 'social', url: '/templates/social.html'}
			# , { name: 'loveall', url: '/templates/loveall.html'}
			# , { name: 'creative', url: '/templates//templates/creative.html'}
			# , { name: 'confidence', url: '/templates/confidence.html'}
			# , { name: 'health', url: '/templates/health.html'}
			# , { name: 'music', url: '/templates/music.html'}
			# , { name: 'laugh', url: '/templates/laugh.html'}
			# , { name: 'compassion', url: '/templates/compassion.html'}
			# , { name: 'forgive', url: '/templates/forgive.html'} 
			]
		# load the template matching the action the user is on
		$scope.template = $scope.templates[gon.brain.action_count%3]
		# $scope.template = $scope.templates[0]

		# save gratitudes
		$scope.saveGratitude = ->
			if this.gratitudeBody
				$scope.actionComplete = true
				Gratitude(this.gratitudeBody).save()
				$scope.brain.points += 100
			return

		$scope.newSendloveName = "them"

		$scope.updateSendloveName = ->
			if this.sendloveName
				$scope.newSendloveName = this.sendloveName
			return

		# save sendlove
		$scope.saveSendlove = ->
			if this.sendloveBody
				$scope.actionComplete = true
				Sendlove(this.sendloveBody, this.sendloveName, this.sendloveEmail).save()
				$scope.brain.points += 100
			return

		# save Dream
		$scope.saveDream = ->
			if this.dreamTitle
				$scope.actionComplete = true
				Dream(this.dreamTitle, null).save()
				$scope.brain.points += 100
			return
	]