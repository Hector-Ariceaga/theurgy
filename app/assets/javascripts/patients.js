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
      let newPatient = new Patient(patient)
      let patientHtml = newPatient.showHtml()
      $('.container').append(patientHtml)
    })
  })
}

function Patient(patient) {
  this.id = patient.id
  this.user = patient.user
  this.name = patient.name
  this.dob = patient.dob
  this.symptoms = patient.symptoms
  this.diagnoses = patient.diagnoses
  this.therapies = patient.therapies
}

Patient.prototype.showHtml = function(){
  debugger
  let patientHtml= `
    <div class="notice"><span>Patient successfully created</span></div>

    <div class="patient_demographics">
      <h1 class="center">${this.name}</h1>
      <h3 class="center>${this.dob}</h3>
    </div>

    <h3>Current Symptoms</h3>
    
    <div class="patient_symptoms">
      <ol>
        ${this.symptoms.map(symptom => `<li>${symptom.name}</li>`)}
      </ol>
    </div>

    <h3>Current Diagnoses</h3>
    
    <div class="patient_diagnoses">
      <ol>
        ${this.diagnoses.map(diagnosis => `<li>${diagnosis.name}</li>`)}
      </ol>
    </div>

    `
    return patientHtml
}

