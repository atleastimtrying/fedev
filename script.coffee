$ ->
  $('.title').click ->
    $('section.showing').removeClass 'showing'
    $(@).parent().addClass 'showing'
