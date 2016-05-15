
function searchDiscogs(event){
  event.preventDefault()
  // console.log(data)
  // debugger;
  var query = $(this).serialize() //<--returns string w/input name 
  var searching = $.post("/discogs/search", query)
  searching.done(function(data){
    var options=data.results
    var selector = $(".search-results")
    var html=""
    $.each(options, function(index, result){
      $()
    })
    // pass this off to a results builder
    debugger;
    // grab type, title, (image or thumb), resource_url, id
    // append to div.search-results
  })
 
}

// "  <div class="type"></div>
//   <div class="title"></div>
//   <div class="image"></div>
//   <div class="resource-url"></div>"