$(document).ready(function(){
  $('.glyphicon-star-empty').hover(function(){
    $(this).attr('class', 'glyphicon glyphicon-star');
    $(this).prevAll().attr('class', 'glyphicon glyphicon-star');
  }, function(){
    $(this).attr('class', 'glyphicon glyphicon-star-empty');
    $(this).prevAll().attr('class', 'glyphicon glyphicon-star-empty');
  })

  $('.glyphicon-plus').click(function() {
    $('#restaurant_form').slideToggle()
  })

  $('.glyphicon-star-full').click(function(){
    $(this).attr('class', 'glyphicon glyphicon-star');
    $(this).prevAll().attr('class', 'glyphicon glyphicon-star');
    $('.glyphicon').unbind('mouseenter mouseleave');
    $('.glyphicon').hide();
    var rating = $(this).attr('id');
    var item_id = $(this).siblings('#hidden').text();
    $.ajax({
      url: "/add_rating",
      type: 'POST',
      context: this,
      data: {'rating': rating, 'hidden': item_id, 'csrfmiddlewaretoken': csrftoken },
      dataType: "text",
      success: function(data){
        $(this).siblings('small').text('Rating submitted!')
      },
      error: function(data){
        console.log(data);
      }
    })
  })
})
