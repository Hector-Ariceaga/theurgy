$(document).on('turbolinks:load', function() {
  bindPatientEventHandlers()
})

const bindPatientEventHandlers = () => {
  $('.new_patient').on('submit', function(e){
    e.preventDefault()
    url = this.action
    data = $(this).serialize()
    $.ajax({
      method: 'post',
      url: url,
      data: data
    })
    .done(function(patient){
      $('.container').html('')
    })
  })
}
