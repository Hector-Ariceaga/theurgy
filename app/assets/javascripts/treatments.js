$(document).on('turbolinks:load', function() {
  bindTreatmentEventHandlers()
})

const bindTreatmentEventHandlers = () => {
  $('.all_treatments').click(function(e){
    e.preventDefault()
    $.ajax({
      method: 'get',
      url: '/treatments.json'
    })
    .done(function(treatments) {
      $('.container').html('<div class="notice"></div><h2 class="fh5co-nav center">Treatments</h2><ol></ol>')
      treatments.forEach(treatment => {
        let newTreatment = new Treatment(treatment)
        let treatmentHtml = newTreatment.indexHtml()
        $('.container ol').append(treatmentHtml)
      })
    })
  })

  $(document).on('click', '.show_link', function(e) {
    e.preventDefault()
    let id = $(this).attr('data-id')
    $.ajax({
      method: 'get',
      url: `/treatments/${id}.json`
    })
    .done(function(treatment) {
      $('.container').html('')
      let newTreatment = new Treatment(treatment)
      let treatmentHtml = newTreatment.showHtml()
      $('.container').append(treatmentHtml)
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
  <li><a href="/treatments/${this.id}" data-id="${this.id}" class="show_link">${this.name}</a></li>
  `
  return treatmentHtml
}

Treatment.prototype.showHtml = function() {
  let treatmentHtml = `
  <div class="notice"></div>
  <h2 class="center">${this.name}</h2>
  <p>${this.details}</p>
  `
  return treatmentHtml
}
