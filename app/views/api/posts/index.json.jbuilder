json.array! @posts do |post|
  json.content post.content
  json.image post.image.url
  json.created_at post.created_at
  json.name post.user.name
  json.id post.id
end