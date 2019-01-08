$(document).on('turbolinks:load', function() {
  bindEventHandlers()
})

const bindEventHandlers = () => {
  $('.all_treatments').click(function(e){
    e.preventDefault()
    $.ajax({
      method: 'get',
      url: '/treatments.json'
    })
    .done(function(treatments) {
      $('.container').html('<ol></ol>')
      treatments.forEach(treatment => {
        let newTreatment = new Treatment(treatment)
        let treatmentHtml = newTreatment.indexHtml()
        $('.container ol').append(treatmentHtml)
      })
    })
  })
}

function Treatment(treatment) {
  this.id = treatment.id
  this.name = treatment.name
  this.details = treatment.details
}

Treatment.prototype.indexHtml = function() {
  let treatmentHtml = `
  <li>${this.name} | <a href="/treatments/${this.id}">View Treatment</a></li>
  `
  return treatmentHtml
}
