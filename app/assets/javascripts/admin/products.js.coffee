# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#  Add another images
$(->
  $('a#add_another_image').click(->
    url = "/images/new?number=" + $('#files input').length
    $.get(url, 
      (data)->
        $('#files').append(data)
    )
  )
)
