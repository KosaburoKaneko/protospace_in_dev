$(document).on('turbolinks:load', function() {

  var prototype_zone = $(".proto-zone")

  function buildHTML(prototype){

    if (prototype.likes_count != null ){
      like_html =
      `<div class="proto-likes">
        <p>${prototype.likes_count} likes</p>
      </div>`
    } else {
      like_html =
      `<div class="proto-likes">
        <p>0 likes</p>
      </div>`
    }

    var html =
    `<div class="col-sm-4 col-md-3 proto-content">
        <div class="thumbnail">
          <a href="/prototypes/${prototype.id}">
            <img src="${prototype.image}"></a>
          <div class="caption">
            <h3>
            ${prototype.title}
            </h3>
            <div class="proto-meta">
              <div class="proto-user">
                <a href="/user/${prototype.user_id}">
                ${prototype.user_name}</a>
              </div>
              <div class="proto-posted">
              ${prototype.created_at}
              </div>
            </div>
          ${like_html}
        </div>
    </div>`

    return html;
  }

  $("#btn-popular").on("click", function(e){
    e.preventDefault();
    $.ajax({
      url: "/prototypes",
      type: "GET",
      dataType: 'json'
    })
    .done(function(prototypes){
      prototypes.sort(function(a,b){
        return (a.likes_count < b.likes_count ? 1 : -1)
      })
      prototype_zone.empty();
      prototypes.forEach(function(prototype){
        prototype_zone.append(buildHTML(prototype));
      })
    })
    .fail(function(){
      alert('error');
    })
  })

  $("#btn-newest").on("click", function(e){
    e.preventDefault();
    $.ajax({
      url: "/prototypes",
      type: "GET",
      dataType: 'json'
    })
    .done(function(prototypes){
      prototypes.sort(function(a,b){
        return (a.created_at > b.created_at ? 1 : -1)
      })
      prototype_zone.empty();
      prototypes.forEach(function(prototype){
        prototype_zone.append(buildHTML(prototype));
      })
    })
    .fail(function(){
      alert('error');
    })
  })
})
