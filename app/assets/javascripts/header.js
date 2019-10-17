$( document ).on('turbolinks:load', function() {
  $(function () {
    $('.top-menu').click(function () {
        $('.main-menu-side').fadeIn('fast');
    });
  });

  $(function () {
    $('.groups__menu-close-btn').click(function () {
        $('.main-menu-side').fadeOut('fast');
    });
  });

  $(function(){
    $('.groups__search-title').click(function(){
      $('.group').slideToggle('fast');
    });
  });
});

