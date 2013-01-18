class App
  constructor:->
    @canvas = new Canvas()
    $(window).mousemove @mousemove
    $(window).bind 'touchmove', @mousemove
    $(window).bind 'touchstart', @mousemove
    $(window).bind 'touchend', @mousemove

  mousemove: (event)=>
    @canvas.clear()
    @canvas.strokeStyle 'rgba(0,0,0,0.5)'
    @canvas.fillStyle 'rgba(0,0,0,0.2)'
    @canvas.bothCircle event.pageX, event.pageY, 20

$ ->
  window.app = new App
  $('section h2').click ->
    $(@).parent().toggleClass 'off'
  

