json.array!(@plans) do |plan|
  json.extract! plan, :id, :description, :price, :max_restaurants, :max_employees, :max_items, :periodicity, :discount, :renew, :date_signature
end
