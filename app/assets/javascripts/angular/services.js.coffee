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
      return (sendloveBody, sendloveName, sendloveEmail, sendToId) ->
        $resource("/sendloves.json", {name:sendloveName, body: sendloveBody, email: sendloveEmail, send_to_id: sendToId},
          save:
            method: "POST"
        )
  ]

  mindblissServices.factory "Signup", [
    "$resource"
    ($resource) ->
      return (first_name, email, password) ->
        $resource("/api/v1/api_users.json", {first_name:first_name, email: email, pw: password},
          save:
            method: "POST"
        )
  ]

  mindblissServices.factory "SendloveReply", [
    "$resource"
    ($resource) ->
      return (sendloveBody, sendloveName, sendloveEmail) ->
        $resource("/sendlovereply.json", {name:sendloveName, body: sendloveBody, email: sendloveEmail},
          save:
            method: "POST"
        )
  ]

  mindblissServices.factory "Dream", [
    "$resource"
    ($resource) ->
      return (title, minutes_per_week) ->
        $resource("/dreams.json", {title: title, minutes_per_week: minutes_per_week},
          save:
            method: "POST"
        )
  ]