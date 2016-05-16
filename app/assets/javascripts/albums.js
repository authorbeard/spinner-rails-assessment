function importAlbum(data){
  var alb = $(this).attr("data-alb")
  $.post("albums", {album: alb}, "json").success(function(data){
    debugger;
    var alb=data.album
    $("div.messages").html("<h3><a href='/albums/" + alb.id + "'>Imported" + alb.title + "</a></h3>")
  })
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

// function buildAlbumShow(albObj){
//   // ///THIS IS FROM USER#SHOW, SET UP FOR ARRAY
//   // ///REFACTOR TO BUILD INDIVIDUAL ALBUM
//   var content = ""
//   var url = "http://localhost:3000/"
//   $.each(albums, function(i, alb){
//     content += "<h1><a href='" + url + "albums/" + alb.id + "'>" + alb.title + "</a></h1>"
//     content += "<img src='<%= asset_path("Album_half.jpg") %>' />"
//     content += "<h2>by " + alb.artist["name"] + "</h2>"
//     content += "<h3><a href='" + url + "albums/" + alb.id + "/import_songs'>Get this album's tracks</a></h3>"
//     content += albumSpinDisplay(spinInfo[i])
//   })
// }

