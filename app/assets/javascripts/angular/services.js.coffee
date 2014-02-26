if gon.logged_in
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
      return (sendloveBody, sendloveName, sendloveEmail) ->
        $resource("/sendloves.json", {name:sendloveName, body: sendloveBody, email: sendloveEmail},
          save:
            method: "POST"
        )
  ]