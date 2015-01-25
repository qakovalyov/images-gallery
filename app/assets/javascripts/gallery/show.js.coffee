$(document).on 'page:load', ->
  $('.thumbnails').on 'click', '.lightbox-link', (e)->
    e.preventDefault();
    $(this).ekkoLightbox()



