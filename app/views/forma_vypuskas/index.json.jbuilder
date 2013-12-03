json.array!(@forma_vypuskas) do |forma_vypuska|
  json.extract! forma_vypuska, :name
  json.url forma_vypuska_url(forma_vypuska, format: :json)
end
