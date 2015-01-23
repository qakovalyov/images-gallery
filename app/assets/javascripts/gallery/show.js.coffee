jQuery ->
  $('.thumbnails').on 'click', '.lightbox-link', (e)->
    e.preventDefault();
    $(this).ekkoLightbox()



