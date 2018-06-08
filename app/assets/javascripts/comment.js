$(document).on("turbolinks:load", function() {
  function buildHTML(comment) {
    var html = `<div class="comment__body">
                  <h5 class="user-name">
                    ${comment.user_name}
                    <span class="posted-time">
                      ${comment.created_at}
                    </span>
                  </h5>
                  <p class="comment-body">
                    ${comment.content}
                  </p>
                  <a href="/prototypes/${comment.prototype_id}/comments/${comment.id}/edit" class="btn btn-info btn-xs">
                    編集
                  </a>
                  <a rel="nofollow" data-method="delete" href="/prototypes/${comment.prototype_id}/comments/${comment.id}" class="btn btn-info btn-xs">
                    削除
                  </a>
                </div>`;
    return html;
  }

  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.comment__content').append(html)
      $('.comment textarea').val('')
      $('.comment input').prop("disabled", false)
    })
    .fail(function() {
      alert('エラーが発生しました');
    })
  })
})
