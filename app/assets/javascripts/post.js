$( document ).on('turbolinks:load', function() {
  $(function(){
    function buildHTML(post){
      var image = (post.image) ? `<img class= "lower-post__image" src=${post.image} >` : "";
      var html =`<div class="post" data-post-id="${post.id}">
                  <div class="post__upper-info">
                    <p class="post__upper-info__talker">
                      ${post.name}
                    </p>
                    <p class="post__upper-info__date">
                      ${post.created_at}
                    </p>
                  </div>
                    <p class="post__text">
                    </p>
                    <p class="lower-post__content">
                      ${post.content}
                    </p>
                      ${image}
                  </div>`
      return html;
    }

    $('#new_post').on('submit',function(e){
      e.preventDefault();
      var formData = new FormData(this);
      var url = $(this).attr('action');
      $.ajax({
        url: url,
        type: "post",
        data: formData,
        dataType: 'json',
        processData: false,
        contentType: false
      })
      .done(function(data){
        var html = buildHTML(data);
        $('.posts').append(html);
        $("form")[0].reset();
        $('.posts').animate({scrollTop: $('.posts')[0].scrollHeight});
      })
      .fail(function(data){
        alert("送信エラー");
      })
      .always(function(data){
        $('.submit-btn').prop('disabled', false);　
      })
    })

    var reloadposts = function() {
      if (window.location.href.match(/\/groups\/\d+\/posts/)){
      last_post_id = $('.post:last').data('post-id');
      $.ajax({
        url: 'api/posts',
        type: 'get',
        dataType: 'json',
        data: {id: last_post_id}
      })
      .done(function(posts) {
        var insertHTML = '';
        posts.forEach(function(post){
          insertHTML = buildHTML(post);
          $('.posts').append(insertHTML);
          $('.posts').animate({scrollTop: $('.posts')[0].scrollHeight}, 'fast');
        })
      })
      .fail(function() {
        alert("自動更新に失敗しました")
      });
      };
    };
  setInterval(reloadposts, 5000);
  });

  $(function () {
    $('.main-header__new-post').click(function () {
        $('.form-box').fadeIn('fast');
    });
  });

  $(function () {
    $('.close-btn').click(function () {
        $('.form-box').fadeOut('fast');
    });
  });

  $(function () {
    $('.submit-btn').click(function () {
        $('.form-box').fadeOut('fast');
    });
  });

});