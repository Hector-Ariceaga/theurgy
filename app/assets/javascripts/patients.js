$(document).on('turbolinks:load', function() {
  // bindPatientEventHandlers()
})

const bindPatientEventHandlers = () => {
  $('.show_patient').click(function(e){
    e.preventDefault()
    let patient_id = $('#patient_id')
    $.ajax({
      method: 'get',
      url: `/users/${user_id}/patients/${patient_id}.json`
    })
    .done(function(patient){
      $('.container').html('')
    })
  })
}
