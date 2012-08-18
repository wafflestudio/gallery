# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#top_buttons a').hover ->
    $(this).animate {"top": '-=30px'}, "slow"
  , ->
    $(this).animate {"top": '+=30px'}, "slow"
  return
