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
      data: data
    })
    .done(function(therapy){
      console.log(therapy)
      $('.no-therapy').html('')
      let newTherapy = new Therapy(therapy)
      let therapyHtml = newTherapy.indexHtml()
      $('.all-therapies').append(therapyHtml)
    })
  })
}

function Therapy(therapy) {
  this.id = therapy.id
  this.patient_id = therapy.patient_id
  this.treatment_id = therapy.treatment_id
  this.active = true

  this.patient_name = therapy.patient.name
  this.treatment_name = therapy.treatment.name

  this.activityStatus = function(){
    if(this.active === true){
      return `${this.patient_name}'s treatment(${this.treatment_name}) is active.`
    }
    else {
      return `${this.patient_name}'s treatment(${this.treatment_name}) is not active.`
    }
  }
}

Therapy.prototype.indexHtml = function() {
  let therapyHtml = `
    <li>${this.activityStatus()} | <a href="/treatments/${this.treatment_id}">Details</a> | <a href="/therapies/${this.id}/edit">Edit Therapy</a> | <a data-confirm="Are you sure you want to delete this therapy?" rel="nofollow" data-method="delete" href="/therapies/${this.id}">Delete</a></li>
    `
  return therapyHtml
}
