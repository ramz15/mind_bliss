mindblissServices = angular.module('mindblissServices', ['ngResource'])

mindblissServices.factory "Brain", [
  "$resource"
  ($resource) ->
    return $resource("/brains/:id.json", null,
      update:
        method: "PUT"
    )
]


mindblissServices.factory "Gratitude", [
  "$resource"
  ($resource) ->
    return (gratitudeBody) ->
      $resource("/gratitudes.json", {body: gratitudeBody},
        save:
          method: "POST"
      )
]

mindblissServices.factory "Sendlove", [
  "$resource"
  ($resource) ->
    return (sendloveBody, sendloveEmail) ->
      $resource("/sendlove.json", {body: sendloveBody, email: sendloveEmail},
        save:
          method: "POST"
      )
]