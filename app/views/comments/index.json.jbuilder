json.array!(@comments) do |comment|
  json.extract! comment, :commentable_id, :commentable_type, :content, :user_id, :ancestry
  json.url comment_url(comment, format: :json)
end
