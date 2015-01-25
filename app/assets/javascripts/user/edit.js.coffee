ready = ->
  bindChangeImage = () ->
  $("input[type='file']").on 'change', (e) ->
    previewImg(@)

$(document).on 'page:load', ready
$(document).ready ready