bindChangeImage = () ->
  $("input[type='file']").on 'change', (e) ->
    previewImg(@)

jQuery ->
  bindChangeImage()
