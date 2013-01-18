(function() {
  var App;
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  App = (function() {

    function App() {
      this.mousemove = __bind(this.mousemove, this);      this.canvas = new Canvas();
      $(window).mousemove(this.mousemove);
      $(window).bind('touchmove', this.mousemove);
      $(window).bind('touchstart', this.mousemove);
      $(window).bind('touchend', this.mousemove);
    }

    App.prototype.mousemove = function(event) {
      this.canvas.clear();
      this.canvas.strokeStyle('rgba(0,0,0,0.5)');
      this.canvas.fillStyle('rgba(0,0,0,0.2)');
      return this.canvas.bothCircle(event.pageX, event.pageY, 20);
    };

    return App;

  })();

  $(function() {
    window.app = new App;
    return $('section h2').click(function() {
      return $(this).parent().toggleClass('off');
    });
  });

}).call(this);
