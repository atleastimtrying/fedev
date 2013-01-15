window.A =
  addData: (label, object)->
    A.objects = {} unless A.objects
    A.objects[label] = object

  getData: (label)->
    A.objects[label]

  getOne:(label)->
    object = A.getData(label)
    object[Object.keys(object)[0]]

  addFunction: (label, fn)->
    A.functions = {} unless A.functions
    A.functions[label] = fn

  getFunction: (label)->
    A.functions[label]

  bind: (object, evnt, fn)->
    object.addEventListener evnt, fn, false

  click: (selector)->
    A.bind A.select(selector), 'click', A.functions[selector]

  visible: (object)->
    object.style.display isnt 'none'

  select: (selector)->
    document.getElementsByClassName(selector)[0]

  each: (items, fn)->
    for item of items
      fn items[item]

  hideAll: (items)->
    A.each items, A.hide

  hide: (item)->
    item.style.display = 'none'

  showAll: (items)->
    A.each items, A.show

  show: (item)->
    item.style.display = 'block'

  fill: (items)->
    object = {}
    for item in items
      object[item] = A.select item
    object

  find: (object, item)->
    object[item]
   
A.bind window, 'load', ->
  A.addData 'elements', A.fill ['html', 'css', 'js']
  A.addData 'rubyElements', A.fill ['haml', 'scss', 'cs']
  A.hideAll A.getData 'elements'
  A.addFunction 'toggle', (evnt)->
    if A.visible A.getOne 'elements'
      A.hideAll A.getData 'elements'
      A.showAll A.getData 'rubyElements'
    else
      A.hideAll A.getData 'rubyElements'
      A.showAll A.getData 'elements'
    false
  A.click 'toggle'
