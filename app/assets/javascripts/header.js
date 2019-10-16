$( document ).on('turbolinks:load', function() {
  $(function(){
    $(".new-project").on("click",function(){
      $('.new-select-list').animate({ height: 'toggle'}, 'nomal' );
    });
  });

  $(function(){
    $(".top-menu").on("click",function(){
      $('.chat-side').animate({ width: 'toggle'}, 'fast' );
    });
  });
});

