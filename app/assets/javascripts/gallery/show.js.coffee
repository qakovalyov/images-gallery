$(document).delegate '*[data-toggle="lightbox"]', 'click', (e)->
  e.preventDefault()
  $(this).ekkoLightbox()

