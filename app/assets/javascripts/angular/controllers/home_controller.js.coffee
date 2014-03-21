if gon.logged_in
	@mindbliss.controller 'HomeCtrl', ['$scope', "Gratitude", "Brain", "Sendlove", "Dream", "Dreamgoal", "Exercise", ($scope, Gratitude, Brain, Sendlove, Dream, Dreamgoal, Exercise) ->
		# set $scope objects user and brain
		$scope.user = gon.user
		$scope.brain = gon.brain
		$scope.actionComplete = false

		# all action templates array
		$scope.templates =
			[ { name: 'gratitude', url: '/templates/gratitude.html', urlComplete: '/templates/gratitude_complete.html'}
			, { name: 'sendlove', url: '/templates/sendlove.html'} 
			, { name: 'dream', url: '/templates/dream.html'}
			, { name: 'exercise', url: '/templates/exercise.html'}
			# , { name: 'meditation', url: '/templates/meditation.html'}
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
		# $scope.template = $scope.templates[gon.brain.action_count%4]
		$scope.template = $scope.templates[2]

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

		# save Dreams
		$scope.saveDream = ->
			if this.dreamTitle
				$scope.actionComplete = true
				Dream(this.dreamTitle, this.dreamMinutesGoal).save ((data) ->
				  $scope.dreamId = data.dream_id
				  return
				), (err) ->
				  $scope.showError = true
				  return
				$scope.brain.points += 100
			return

		$scope.dreamGoalComplete = false
		$scope.saveDreamGoal = ->
			if this.saveDreamGoal
				console.log this.dreamId
				$scope.dreamGoalComplete = true
			# Dreamgoal(this.dreamTitle, this.dreamId).save()
				$scope.brain.points += 100



		# save Exercise
		$scope.saveExercise = ->
			if this.exerciseMinutes
				$scope.actionComplete = true
				Exercise(this.exerciseMinutes).save()
				$scope.brain.points += 100
			return
	]