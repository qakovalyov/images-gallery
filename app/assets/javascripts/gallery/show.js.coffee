ready = ->
  $('.thumbnails').on 'click', '.lightbox-link', (e) ->
    e.preventDefault();
    $(this).ekkoLightbox()

$(document).on 'page:load', ready
$(document).ready ready


