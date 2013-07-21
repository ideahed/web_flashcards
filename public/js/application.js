$(document).ready(function() {
  $('body').css('display', 'none');
  $('body').fadeIn(1000);
  
  $('.link').click(function() {
  event.preventDefault();
  newLocation = this.href;
  $('body').fadeOut(1000, newpage);
  });
  function newpage() {
  window.location = newLocation;
  }

  // Ajax for cards:
  $('#guess').on('submit', function(e) {
      console.log($(this));
      console.log(this.method);
      console.log(this.action);
      console.log($(this).serialize())

      e.preventDefault();

      $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize()
      }).done(function(msg) {
          var output;
          console.log(msg);
          if (msg.correct == true) {
            output = "That's correct!";
          }
          else {
            output = "Nope, incorrect answer.";
          }
          $('.card').text(output);
          $('.card').append("<br> <a href=\"/round/" + msg.round_id + "/next_card\">Next Card</a>");
      });
    });


  $('#add-another-card').on('click', function(){
  	$(".add-card").clone().toggle().prependTo("#add-more-cards");
  });
// var this_method = function(msg) {
//           console.log("success!");
//           console.log(msg);
//           var output;
//           // console.log(msg.correct);
//           if (msg.correct == true) {
//             output = "That's correct!";
//           }
//           else
//             output = "Nope, incorrect answer.";
//           }
//           $('.card').text("wheee!");
// };


// 1
// 2
// 3
// 4
// 5
// 6
// 7
// $.ajax({
//   type: "POST",
//   url: "some.php",
//   data: { name: "John", location: "Boston" }
// }).done(function( msg ) {
//   alert( "Data Saved: " + msg );
// });
});
