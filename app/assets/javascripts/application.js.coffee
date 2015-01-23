# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require ekko-lightbox
#= require turbolinks
#= require_tree .


window.previewImg = (input) ->
  if input.files && input.files[0]
    reader = new FileReader()
    reader.onload = (e) ->
      $previewImg = $(input).closest('form').find('.js-preview img')
      $previewImg.attr('src', e.target.result)
      imgResizeToFill()
    reader.readAsDataURL(input.files[0])

window.imgResizeToFill = () ->
  $crop = $('.js-resize')
  $img = $crop.find('img')
  $img.removeAttr('style')
  $img.css('width', '')
  $img.css('height', '')
  if $img.width() < $img.height()
    $img.css('width', $crop.width())
  else
    $img.css('height', $crop.height())
  widthDiff = $crop.width() - $img.width()
  $img.css('margin-left', widthDiff/2 + 'px')
  if $img.height() < $crop.height()
    heightDiff = $crop.height() - $img.height()
    $img.css('margin-top', heightDiff/2 + 'px')
  else $img.css('top', '0 px')

