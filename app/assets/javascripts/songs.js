function getSongArtist(){
  event.preventDefault()
  var id=parseInt(this.attributes[1].value)
  $.get("/songs/" + id + ".json").success(function(data){
    // debugger;
    var artist=data.artist.name
    $('#'+id).append("<h4>" + artist + "</h4>")
  })
}