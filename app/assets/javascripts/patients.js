$(document).on('turbolinks:load', function() {
  bindPatientEventHandlers()
})

const bindPatientEventHandlers = () => {
  $('.show_patient').click(function(e){
    e.preventDefault()
    let user_id = $(this).attr('data-user')
    let patient_id = $(this).attr('data-patient')
    $.ajax({
      method: 'get',
      url: `/users/${user_id}/patients/${patient_id}.json`
    })
    .done(function(patient){
      $('.container').html('')
    })
  })
}
