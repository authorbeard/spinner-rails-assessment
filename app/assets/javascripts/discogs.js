
function searchDiscogs(event){
  event.preventDefault()
  // console.log(data)
  // debugger;
  var query = $(this).serialize() //<--returns string w/input name 
  var searching = $.post("/discogs/search", query)
  searching.done(function(data){
    var options=data.results
    console.log(data)
    debugger;
  })
 
}