function importAlbum(data){
  debugger;
  var alb = $(this).attr("data-alb")
  $.post("albums", {album: alb}, "json")
}


function albumSpinner(data){

  var id = parseInt($(this).attr("data"))
  var selector = "div[data-albid='" + id + "'] "

  $.post("/albums/" + id + "/spin", function(data){
    var spinOpts = albumSpinDisplay(data)
    $(selector).html(spinOpts)
  })
}

function albumSpinDisplay(data){

  if (data.user_album !== undefined){
    var album = data.user_album  
  }else{
    var album = data
  }

  var id = album.album_id
  var spinOptions = ""
  spinOptions += "<h2>Spin count: " + album.spins + "</h2>"
  spinOptions += "<h3>Last Spun: " + Date().split(" ").slice(0,4).join(" ") + "</h3>"
  spinOptions += "<button class='spin-it' id='album-" + id + "' data='" + id + "'>Spin it!</button>"
  return spinOptions

}


