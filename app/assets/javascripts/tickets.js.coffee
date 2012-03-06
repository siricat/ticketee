# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
  $('a#add_another_file').click(->
    url = "/files/new?number=" + $('#files input').length
    $.get(url,
      (data)->
        $('#files').append(data)
    )
  )
)

# coffeescript above is equal to this jquery below:
# $(function() { 
#   return $('a#add_another_file').click(function() {
#     var url; 
#     url = "/files/new?number=" + $('#files input').length; 
#     return $.get(url, function(data) {
#       return $('#files').append(data); 
#     });
#   }); 
# });