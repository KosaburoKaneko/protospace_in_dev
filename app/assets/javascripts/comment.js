$(function() {
  function buildHTML(comment) {
    var html = `<div class="main_content__chat_space__comment">
                  ${comment.content}
                  ${comment.created_at}
                  <a href="/prototypes/${comment.prototype_id}/comments/${comment.id}/edit">編集</a>
                  <a rel="nofollow" data-method="delete" href="/prototypes/${comment.prototype_id}/comments/${comment.id}">削除</a>
                </div>`

    return html
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
      $('.comment').append(html)
      $('.comment textarea').val('')
      $('.comment input').prop("disabled", false)
    })
    .fail(function() {
      alert('エラーが発生しました');
    })
  })
})
