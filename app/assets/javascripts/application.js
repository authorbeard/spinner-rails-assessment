// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= rquire bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  
  $("button.spin-it").click(function(event) {
    $(this).css("color", "blue").text("spun!");
    event.preventDefault()
  });



});

// function spinButton() {
//   $("input#spin-it").on('submit', form(event) {
//     $(this).css("background", "blue")
//     event.preventDefault()
//   })
// }


////TESTING AJAX --  THIS ISN'T PASSING THE ID CORRECTLY (ALSO "RESPONSE" IS UNDEFINED)///

//   $("button.spin-it").click(function(event) {
//     var id = $(this).attr('id')
//     $.post('/albums/#{id}/spin', {album_id: id}, function() {
//       console.log(response)
//     })
//     (response).css("color", "blue").text('SPUN!');
//     event.preventDefault()
//   });