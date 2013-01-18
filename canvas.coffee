class window.Canvas
  constructor:->
    @canvas = $ 'canvas'
    @context = @canvas[0].getContext '2d'
    @context.fillCircle = @fillCircle
    $(window).resize @clear              
    @clear()

  clear: (event)=>
    @canvas.width = @canvas[0].width = $(document).width()
    @canvas.height = @canvas[0].height = $(document).height()
    $('canvas').width($(document).width())
    $('canvas').height($(document).height())

  fillStyle:(colour)=>
    @context.fillStyle = colour

  strokeStyle:(colour)=>
    @context.strokeStyle = colour

  fillSquare:(x,y,length)=>
    @context.translate x, y
    @context.fillRect -(length/2), -(length/2), length, length
    @context.translate -x, -y

  circle: (x,y,radius)=>
    @context.beginPath()
    @context.arc x, y, radius, 0, Math.PI * 2, false
    @context.closePath()

  fillCircle: (x,y,radius)=>
    @circle x,y,radius

  strokeCircle: (x,y,radius)=>
    @circle x,y,radius
    @context.stroke()

  bothCircle:(x,y,radius)=>
    @circle x,y,radius
    @context.fill()
    @context.stroke()