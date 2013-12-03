json.array!(@helpfuls) do |helpful|
  json.extract! helpful, :user_id, :review
  json.url helpful_url(helpful, format: :json)
end
