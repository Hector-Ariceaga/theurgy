$(document).on('turbolinks:load', function() {
  bindTherapyEventHandlers()
})

const bindTherapyEventHandlers = () => {
  $('#new-therapy').on('submit', function(e){
    e.preventDefault()
    url = this.action
    data = $(this).serialize()
    $.ajax({
      method: 'post',
      url: url,
      data: data,
      success: function(res){
        $('.no-therapy').html('')
        $('.all-therapies').append(res)
      }
    })
  })
}
