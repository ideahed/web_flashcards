$(document).ready(function() {
  // CSS/Javascript page styling...
  // $('body').css('display', 'none');
  // $('body').fadeIn(1000);
  
  // $('.link').click(function() {
  // event.preventDefault();
  // newLocation = this.href;
  // $('body').fadeOut(1000, newpage);
  // });
  // function newpage() {
  // window.location = newLocation;
  // }

  // Client side signup text field validations
  // $('#user_name').validate({
  //   // console.log('yuuuup!');
  //   onkeyup: function () {
  //     $('.left_tab').append("<p>'YESSSS!'</p>");
  //   }
  // });

  // function checkBox() {
  $('#user_name').on('keyup', function(){
    if ($(this).val().length >= 6) {
      $('#user_name_check').show();
    } else {
      $('#user_name_check').hide();
    }
  });

  // $('#user_email').on('keyup', function(){
  //   if ($(this).val().length >= ) {
  //     $('#user_email_check').show();
  //   } else {
  //     $('#user_email_check').hide();
  //   }
  // });

  $('#user_pass').on('keyup', function(){
    if ($(this).val().length >= 4) {
      $('#user_pass_check').show();
    } else {
      $('#user_pass_check').hide();
    }
  });


  // Ajax for accepting a guess and returning the guess result
  $('.card').on('submit', '#guess', function(e) {
      e.preventDefault();
      $.ajax({
        type: this.method,
        url: this.action,
        data: $(this).serialize()
      }).done(function(msg) {
          var output;
          if (msg.correct == true) {
            output = "That's correct!";
          }
          else {
            output = "Nope, incorrect answer.";
          }
          $('.card').hide();
          $('.output').html(output);
          $('#next_card').html("<a href='/round/" + msg.round_id + "/next_card'>Continue</a>");
          $('.answer').show();          
      });
    });

  // Ajax for getting the next card from the deck.
  $('#next_card').on('click', function(e) {
    e.preventDefault();
    $.ajax({
        type: 'GET',
        url: $(this).find('a').attr('href')
      }).done(function(msg) {
        if (msg.redirect) {
            // data.redirect contains the string URL to redirect to
            $('.answer').html("<div>Deck Finished! There were " + msg.num_cards + " cards and you got " + msg.percentage +"% correct.</div>");
            $('#dash_redirect').html("<a href='/user_dashboard'>Dashboard</a>");
            // window.location.href = msg.redirect;
        }
        else {
          $('.answer').hide();
          $('.card').html(msg.definition + "<form id='guess' action='/guess' method='post'><input type='hidden' value=" + msg.round_id + " name='round_id'><input type='hidden' value=" + msg.card_id + " name='card_id'><input type='text' placeholder='Enter Guess' name='guess'><input type='submit' value='Submit Answer!'><br></form>").show();
        }
      });
    });


   // Add a new deck
  $('#add-another-card').on('click', function() {
  	$(".add-card").clone().toggle().prependTo("#add-more-cards");
  });
});
