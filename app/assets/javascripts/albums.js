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
debugger;
  var album = data["user_album"]
  var id = album["id"]
  var selector = "div[data-albid='" + id + "'] "
  
  var spinOptions = ""
  spinOptions += "<h2>Spin count: " + album["spins"] + "</h2>"
  spinOptions += "<h3>Last Spun: " + Date().split(" ").slice(0,4).join(" ") + "</h3>"
  spinOptions += "<button class: 'spin-it' id='album-" + id + "' data='" + id + "'>Spin it again!</button>"
  $(selector).html(spinOptions)
}