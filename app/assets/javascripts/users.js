
function getUserAlbums(obj){

  event.preventDefault()
  var target = obj["currentTarget"]
  var path = target["pathname"]
  $.get(path + ".json", buildAlbumDivs)
debugger;
}

function buildAlbumDivs(arr){
debugger;
  var albums = arr["users"]
  var page = $("div.page-content").html("<h1>PLAY SOME DAMN RECORDS</h1>")
  var content = ""
  var url = "http://localhost:3000/"

  for (var i=0; i < albums.length; i++){
    var alb = albums[i]
    content += "<h1><a href='" + url + alb.id + "'>" + alb.title + "</a></h1>"
    content += "<h2>by " + alb.artist["name"] + "</h2>"
    content += "<h3><a href='" + url + "/albums/" + alb.id + "/import_songs'>Get this album's tracks</a></h3>"
    // content += albumSpinDisplay(alb)
  }


debugger;
}


