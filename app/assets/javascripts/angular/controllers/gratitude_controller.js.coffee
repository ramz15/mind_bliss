# if gon.logged_in
# 	@mindbliss.controller 'GratitudeCtrl', ['$scope', "Gratitude", ($scope, Gratitude) ->
# 		$scope.actionComplete = false

# 		# save gratitudes
# 		$scope.saveGratitude = ->
# 			if this.gratitudeBody
# 				$scope.actionComplete = true
# 				Gratitude(this.gratitudeBody).save()
# 				$scope.brain.points += 100
# 			return

# 	]