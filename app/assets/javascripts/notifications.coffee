$(document).on 'ready turbolinks:change turbolinks:load', ->
  if (window.location.pathname == '/notifications')
    $('.willhidebyajax').hide()
    $.ajax '/notifications/read_all',
      type: 'PUT'
      dataType: 'json'
      error: (jqXHR, textStatus, errorThrown) -> console.log("Error")
      success: (data, textStatus, jqXHR) -> console.log("Update was success!!")