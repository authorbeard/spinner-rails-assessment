//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require users.js.erb
//= require albums.js
//= require discogs.js

$(document).on("page:update", function(){
  // debugger;
  attachListeners()
})


function attachListeners(){
  $("button.spin-it").click(albumSpinner)
  $("a.user-show").click(getUserAlbums)
  $("#discogs-search").submit(searchDiscogs)

}

