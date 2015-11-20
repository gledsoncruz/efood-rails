json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :cnpj
  json.url restaurant_url(restaurant, format: :json)
end