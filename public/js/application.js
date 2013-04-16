$(document).ready(function() {
  $('form').on('submit', function(e){
    e.preventDefault();
    $('form').children('input').last().attr('disabled', 'disabled');
    $('.container span').text("Sending tweet!");
    $.ajax({
      url: '/tweet',
      data: { tweet: $('form input[name=tweet]').val() },
      method: 'post',
      success: function(response){
        $('.container span').text('Done!');
        $('form').children('input').last().removeAttr('disabled');     
      }, 
      error: function(response){
        $('.container span').text('Error!');
        $('form').children('input').last().removeAttr('disabled'); 
      }
    });
  });
});
