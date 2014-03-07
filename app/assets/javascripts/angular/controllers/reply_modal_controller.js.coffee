# if gon.logged_in
# 	@mindbliss.controller 'ReplyModalCtrl', ['$scope', '$location', 'Signup', ($scope, $location, Signup) ->
# 		# set $scope objects user and brain
# 		url_params = ($location.search())
# 		$scope.newUserEmail = url_params.email
# 		$scope.name = url_params.name

# 		modalInstance = $modal.open(
# 		  templateUrl: "reply_modal.html"
# 		  controller: ModalInstanceCtrl
# 		  resolve:
# 		    name: ->
# 		      $scope.name
# 		    email: ->
# 		    	$scope.newUserEmail
# 		)

# 		modalInstance

# 		# actions to take after modalInstance 
#     # modalInstance.result.then(function (selectedItem) {
#     #   $scope.selected = selectedItem;
#     # }, function () {
#     #   $log.info('Modal dismissed at: ' + new Date());
#     # });

# 		# save sendlove
# 		$scope.saveSendlove = ->
# 			if this.sendloveBody
# 				$scope.actionComplete = true
# 				Sendlove(this.sendloveBody, this.sendloveName, this.sendloveEmail).save()
# 				$scope.brain.points += 100
# 			return
# 	]

# 	@mindbliss.controller 'ModalInstanceCtrl', ['$scope', '$modalInstance', 'name', 'email', ($scope, $$modalInstance, name, email) ->
# 	  $scope.createUser = ->
# 	    $modalInstance.close $scope.selected.item
# 	   # 	if this.sendloveBody
# 				# $scope.actionComplete = true
# 				# Sendlove(this.sendloveBody, this.sendloveName, this.sendloveEmail).save()
# 				# $scope.brain.points += 100
# 	   #  return

# 	  $scope.cancel = ->
# 	    $modalInstance.dismiss "cancel"
# 	    return
# 	 ]