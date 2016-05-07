
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks



$(document).ready(function() {
  $(".spin-it").click(function(event){

    var id = parseInt($(this).attr("data"))
    $.post("/albums/" + id + "/spin", function(data){
      var albData=JSON.parse(data)
      $("#album-" + albData["album"]).css("color", "blue").text(albData["spins"] + " Spins")
      $(".user-spins").text(albData["spins"])
      $(".last-user-spin").text(Date())
    })
    event.preventDefault()
  })
})


////TESTING AJAX --  THIS ISN'T PASSING THE ID CORRECTLY (ALSO "RESPONSE" IS UNDEFINED)///

//   $("button.spin-it").click(function(event) {
//     var id = $(this).attr('id')
//     $.post('/albums/#{id}/spin', {album_id: id}, function() {
//       console.log(response)
//     })
//     (response).css("color", "blue").text('SPUN!');
//     event.preventDefault()
//   });