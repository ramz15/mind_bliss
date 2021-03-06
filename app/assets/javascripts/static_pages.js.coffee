# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# jQuery for login/signup homepage
jQuery ->
  
  # signup button hover changes
  $('.signup-button').hover (->
    $('.signup-button').text('CREATE HAPPINESS')
    $('.signup').css('width', '315px')
  ), ->
    $('.signup-button').text('JOIN THE LOVE')
    $('.signup').css('width', '264px')
    
  # modal background variable
  modalBackground = $('<div></div>').addClass('mindbliss-modal')
  
  # show modal signup box on click of button
  $('.signup-button').click (e) ->
    e.preventDefault()    
    $('body').append(modalBackground)
    $('#signup_box').fadeIn(300)
    
    # remove modal and box on click anywhere outside of the box
    if $('.mindbliss-modal').length
      $('.mindbliss-modal').click (e) ->
        $('.modal-box').fadeOut(200)
        $('.mindbliss-modal').remove()
  
  # show modal login box on click of button
  $('.login-button').click (e) ->
    e.preventDefault()    
    $('body').append(modalBackground)
    $('#login_box').fadeIn(300)

    # remove modal and box on click anywhere outside of the box
    if $('.mindbliss-modal').length
      $('.mindbliss-modal').click (e) ->
        $('.modal-box').fadeOut(200)
        $('.mindbliss-modal').remove()