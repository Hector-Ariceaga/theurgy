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
  let patientHtml= `
    <div class="notice"><span>Patient successfully created</span></div>

    <div class="patient_demographics">
      <h1 class="center">${this.name}</h1>
      <h2 class="center"> Date of Birth: ${this.formatDateTime()}</h2>
    </div>

    <h3>Current Symptoms</h3>
    
    <div class="patient_symptoms">
      ${this.symptomCheck()}
      <ol>
        ${this.symptoms.map(symptom => `<li>${symptom.name}</li>`)}
      </ol>
    </div>

    <h3>Current Diagnoses</h3>
    
    <div class="patient_diagnoses">
      ${this.diagnosisCheck()}
      <ol>
        ${this.diagnoses.map(diagnosis => `<li>${diagnosis.name}</li>`)}
      </ol>
    </div>

    `
    return patientHtml
}

Patient.prototype.formatDateTime = function(){
  let dob = new Date(this.dob);

  let day = dob.getDate();
  let month = dob.getMonth();
  let year = dob.getFullYear();

  let dateString = `${day}/${month+1}/${year}`;
  return dateString
}

Patient.prototype.symptomCheck = function(){
  if(!Array.isArray(this.symptoms) || !this.symptoms.length) {
    return `<p>There are no symptoms yet associated with your new patient.</p>`
  }
  else {
    return ''
  }
}

Patient.prototype.diagnosisCheck = function(){
  if(!Array.isArray(this.diagnosis) || !this.diagnosis.length) {
    return `<p>There are no diagnoses yet associated with your new patient.</p>`
  }
  else {
    return ''
  }
}