// function spinIt {

//     var id = parseInt($(this).attr("data"))
//     $.post("/albums/" + id + "/spin", function(data){
//       var albData=JSON.parse(data)
//       $("#album-" + albData["album"]).css("color", "blue").text(albData["spins"] + " Spins")
//       $(".user-spins").text(albData["spins"])
//       $(".last-user-spin").text(Date())
//     })
//     event.preventDefault()
// }




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

