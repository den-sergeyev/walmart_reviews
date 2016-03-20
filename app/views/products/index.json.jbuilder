json.array!(@products) do |product|
  json.extract! product, :id, :id, :external_id
  json.url product_url(product, format: :json)
end
