
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks



$(document).ready(function() {
  $("button.spin-it").click(function(event){
    var id = parseInt($(this).attr("data"))
    $.post("/albums/" + id + "/spin", function(data){
      album_spin_display(data)
    })
    event.preventDefault()
  })
})


function album_spin_display(data){

  var album = JSON.parse(data)
  var id = album["album"]
  var selector = "div[data-albid='" + id + "'] "
  
  var spinOptions = ""
  spinOptions += "<h2>Spins count: " + album["spins"] + "</h2>"
  spinOptions += "<h3>Last Spun: " + Date().split(" ").slice(0,4).join(" ") + "</h3>"
  spinOptions += "<button class: 'spin-it' id='album-" + id + "' data='" + id + "'>Spin it again!</button>"
debugger;
  $(selector).html(spinOptions)
}



////TESTING AJAX --  THIS ISN'T PASSING THE ID CORRECTLY (ALSO "RESPONSE" IS UNDEFINED)///

//   $("button.spin-it").click(function(event) {
//     var id = $(this).attr('id')
//     $.post('/albums/#{id}/spin', {album_id: id}, function() {
//       console.log(response)
//     })
//     (response).css("color", "blue").text('SPUN!');
//     event.preventDefault()
//   });