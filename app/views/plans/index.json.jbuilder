json.array!(@plans) do |plan|
  json.extract! plan, :id, :description
  json.url plan_url(plan, format: :json)
end
