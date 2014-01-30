# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  
  # signup button hover changes
  $('.signup-button').hover (->
    $('.signup-button').text('CREATE HAPPINESS')
    $('.signup').css('width', '315px')
  ), ->
    $('.signup-button').text('JOIN THE LOVE')
    $('.signup').css('width', '264px')
    
  # modal background variable
  modalBackground = $('<div></div>').addClass('modal-background')
  
  # show modal signup box on click of button
  $('.signup-button').click (e) ->
    e.preventDefault()    
    $('body').append(modalBackground)
    $('#signup_box').fadeIn(300)
    
    # remove modal and box on click anywhere outside of the box
    if $('.modal-background').length
      $('.modal-background').click (e) ->
        $('.modal-box').fadeOut(200)
        $('.modal-background').remove()
  
  # show modal login box on click of button
  $('.login-button').click (e) ->
    e.preventDefault()    
    $('body').append(modalBackground)
    $('#login_box').fadeIn(300)

    # remove modal and box on click anywhere outside of the box
    if $('.modal-background').length
      $('.modal-background').click (e) ->
        $('.modal-box').fadeOut(200)
        $('.modal-background').remove()