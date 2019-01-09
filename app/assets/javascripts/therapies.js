$(document).on('turbolinks:load', function() {
  bindTherapyEventHandlers()
})

const bindTherapyEventHandlers = () => {
  $('#new-therapy').on('submit', function(e){
    e.preventDefault()
    url = this.action
    data = $(this).serialize()
    debugger
    $.ajax({
      method: 'post',
      url: url,
      data: data,
      success: function(res){
        $('.all-therapies').append(res)
      }
    })
  })
}
