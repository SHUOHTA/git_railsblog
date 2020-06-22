$(window).on("load", function() {
  $('.content-post').hover(function() {
    $(this).css('background', '#f0ffff');
  }, function() {
    $(this).css('background', '');
  });
  
  $(".content-post").on("click", function() {
      var id = $(this).find(".blog-id").val();
      location.href="/blogs/" + id;
  });
});
