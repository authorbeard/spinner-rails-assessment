
function searchDiscogs(event){
  var formattedResults
  var query = $(this).serialize() //<--returns string w/input name 
  // debugger;
  var search = $.post("/discogs/search", query, function(data){
    var rawResults=data.results
    formattedResults=buildResults(rawResults)
  })

  search.done(function(){
    $.each(formattedResults, function(i, result){
      $(".search-results").append(result)
    })
  })

  event.preventDefault()
}

//THIS RETURNS AN ARRAY OF STRINGS
function buildResults(array){
  var results=[]

  $.each(array, function(i, res){
    //THIS PASSES EACH OBJECT IN THE RESULTS ARRAY TO THE BUILDER
    var result = new ResultBuilder(res)
    var html = result.buildTitle()
  
        html += result.setImage() 
        html += result.buildLink() 
        html += result.importThis()
    results.push(html)
  })
  return results 
}

//THIS GENERATES AN OBJECT FOR EACH RESULT OBJECT
//ALSO SETS ITS TYPE & DC_ID 

function ResultBuilder(resultObj){

  if (resultObj.type === "master" || resultObj.type === "release"){
    this.type="album"
    var artistTitle=resultObj.title.split(" - ")
    this.album = new Album(artistTitle, resultObj.catno, resultObj.id, resultObj.resource_url, resultObj.year, resultObj.thumb)
    // this.cover = resultObj.thumb

  }else if(resultObj.type==="artist"){
    this.type="artist"
    this.artist=new Artists(resultObj.name)
  }
}

function Album(artistTitle, catno, rel_id, url, year, cover){
  this.title=artistTitle[1]
  this.group=artistTitle[0]
  this.catalog_no=catno
  this.rel_id=rel_id
  this.alb_url=url
  this.rel_date=year
  this.cover = cover
}

// function ArtistBuilder(obj){
//   this.name=obj.name
// }

// //THESE ADD THINGS TO THE HTML STRING TO BE RETURNED ABOVE

ResultBuilder.prototype.buildTitle=function(){
  return "<h2>" + this.album.title + "</h2>"
}

ResultBuilder.prototype.setImage=function(){
  return "<img src='" + this.album.cover + "'></img><br>"
}

ResultBuilder.prototype.buildLink=function(){
  return "<h4><a href='" + this.album.alb_url + "'>See on Discogs</a></h4>"
}

ResultBuilder.prototype.importThis=function(){
  // return "<h4><a href='/albums/create'>Import this!</a></h4>"
  return "<button type='submit' id='import-album' data-alb='" + JSON.stringify(this.album) + "'>Import this one</button>"
}