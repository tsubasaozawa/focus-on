json.name  @post.user.name
json.created_at  @post.created_at.strftime("%Y/%m/%d %H:%M")
json.content  @post.content
json.image   @post.image.url
json.id @post.id