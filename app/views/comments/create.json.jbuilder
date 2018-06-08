json.id           @comment.id
json.content      @comment.content
json.created_at   @comment.created_at.to_s(:datetime)
json.prototype_id @comment.prototype_id
json.user_name    @comment.user.name
