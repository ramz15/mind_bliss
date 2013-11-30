# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.box-happiness').click ->
    $('body').append('<div class="love-modal"></div>')
    $('body').append('<div class="mind-modal-box"><div class="meditation-image"></div><div class="love-close">x</div></div>')
    $('.love-modal').hide().fadeIn(1000)
    $('.mind-modal-box').hide().fadeIn(1000)
    # append audio player with meditation
    # TODO: detect when meditation is finished and add neurons and happiness to user
    $('.love-close').click ->
      $('.mind-modal-box').fadeOut(400)
      $('.love-modal').fadeOut(400)
    