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
      $('.container').html('')
      treatments.forEach(treatment => console.log(treatment))
    })
  })
}
