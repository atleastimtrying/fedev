(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.Canvas = (function() {

    function Canvas() {
      this.bothCircle = __bind(this.bothCircle, this);
      this.strokeCircle = __bind(this.strokeCircle, this);
      this.fillCircle = __bind(this.fillCircle, this);
      this.circle = __bind(this.circle, this);
      this.fillSquare = __bind(this.fillSquare, this);
      this.strokeStyle = __bind(this.strokeStyle, this);
      this.fillStyle = __bind(this.fillStyle, this);
      this.clear = __bind(this.clear, this);      this.canvas = $('canvas');
      this.context = this.canvas[0].getContext('2d');
      this.context.fillCircle = this.fillCircle;
      $(window).resize(this.clear);
      this.clear();
    }

    Canvas.prototype.clear = function(event) {
      this.canvas.width = this.canvas[0].width = $(document).width();
      this.canvas.height = this.canvas[0].height = $(document).height();
      $('canvas').width($(document).width());
      return $('canvas').height($(document).height());
    };

    Canvas.prototype.fillStyle = function(colour) {
      return this.context.fillStyle = colour;
    };

    Canvas.prototype.strokeStyle = function(colour) {
      return this.context.strokeStyle = colour;
    };

    Canvas.prototype.fillSquare = function(x, y, length) {
      this.context.translate(x, y);
      this.context.fillRect(-(length / 2), -(length / 2), length, length);
      return this.context.translate(-x, -y);
    };

    Canvas.prototype.circle = function(x, y, radius) {
      this.context.beginPath();
      this.context.arc(x, y, radius, 0, Math.PI * 2, false);
      return this.context.closePath();
    };

    Canvas.prototype.fillCircle = function(x, y, radius) {
      return this.circle(x, y, radius);
    };

    Canvas.prototype.strokeCircle = function(x, y, radius) {
      this.circle(x, y, radius);
      return this.context.stroke();
    };

    Canvas.prototype.bothCircle = function(x, y, radius) {
      this.circle(x, y, radius);
      this.context.fill();
      return this.context.stroke();
    };

    return Canvas;

  })();

}).call(this);
