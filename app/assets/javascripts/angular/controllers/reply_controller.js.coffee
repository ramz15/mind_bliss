if gon.logged_in
	@mindbliss.controller 'ReplyCtrl', ['$scope', '$location', '$modal', 'Signup', 'Sendlove', ($scope, $location, $modal, Signup, Sendlove) ->
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
		$scope.notLoggedIn = gon.not_logged_in
		$scope.newUser = Signup

		$scope.saveSignup = ->
			if this.password
				$scope.notLoggedIn = false
				Signup($scope.name, $scope.newUserEmail, this.password).save()
			return

		# save sendlove
		$scope.saveSendlove = ->
			if this.sendloveBody
				$scope.actionComplete = true
				Sendlove(this.sendloveBody, $scope.senderName, "", $scope.senderId, $scope.newUser.id, $scope.newUser.auth_token).save()
				$scope.brain.points += 100
			return
	]