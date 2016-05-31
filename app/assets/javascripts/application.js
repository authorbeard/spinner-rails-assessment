//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require users.js.erb
//= require albums.js.erb
//= require discogs.js
//= require songs.js

$(document).on("page:update", function(){
  // debugger;
  attachListeners()
})


function attachListeners(){
  $("button.spin-it").click(albumSpinner)
  $("a.user-show").click(getUserAlbums)
  $("#discogs-search").submit(searchDiscogs)
  $("button#import-album").click(importAlbum)
  $("h3.song").click(getSongArtist)
}

