json.array!(@items) do |item|
  json.extract! item, :id, :description, :price, :available, :discount
  json.url item_url(item, format: :json)
end
