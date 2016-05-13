function albumSpinner(data){
  event.preventDefault()

  var id = parseInt($(this).attr("data"))
  var selector = "div[data-albid='" + id + "'] "

  $.post("/albums/" + id + "/spin", function(data){
    var spinOpts = albumSpinDisplay(data)
    $(selector).html(spinOpts)
  })


}

function albumSpinDisplay(data){
debugger;
  if (data.user_album !== undefined){
    var album = data.user_album  
  }else{
    var album = "whatever"
  }
  
  // var id = album["id"]
  // var selector = "div[data-albid='" + id + "'] "
  
  var spinOptions = ""
  spinOptions += "<h2>Spin count: " + album["spins"] + "</h2>"
  spinOptions += "<h3>Last Spun: " + Date().split(" ").slice(0,4).join(" ") + "</h3>"
  spinOptions += "<button class: 'spin-it' id='album-" + id + "' data='" + id + "'>Spin it!</button>"
  // $(selector).html(spinOptions)
  return spinOptions
}