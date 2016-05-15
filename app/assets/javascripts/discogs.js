
function searchDicogs(event){
  event.preventDefault()
  // console.log(data)
  // debugger;
  var query = $(this).serialize() //<--returns string w/input name 
  var results = $.post("/discogs/search", query)
  debugger;
}