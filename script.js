
  $(function() {
    return $('.title').click(function() {
      $('section.showing').removeClass('showing');
      return $(this).parent().addClass('showing');
    });
  });
