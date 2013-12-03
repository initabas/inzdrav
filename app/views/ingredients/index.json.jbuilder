json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :name, :description, :ingredient_group_id
  json.url ingredient_url(ingredient, format: :json)
end
