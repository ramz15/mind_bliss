if gon.logged_in
	@mindbliss.controller 'ReplyCtrl', ['$scope', '$location', "Signup", "Sendlove", ($scope, $location, Signup, Sendlove) ->
		# set $scope objects user and brain
		url_params = ($location.search())
		$scope.user = gon.user
		$scope.brain = gon.brain
		$scope.actionComplete = false
		$scope.body = url_params.body
		$scope.newUserEmail = url_params.email
		$scope.senderName = url_params.sender_name
		$scope.senderId = url_params.sender_id
		$scope.name = url_params.name

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
	]