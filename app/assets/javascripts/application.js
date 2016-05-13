//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require users.js
//= require albums.js

$(document).ready(function(){
  attachListeners()
})


function attachListeners(){
  $("button.spin-it").click(albumSpinner)
  $("a.user-show").click(getUserAlbums)
}

