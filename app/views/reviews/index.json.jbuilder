json.array!(@reviews) do |review|
  json.extract! review, :id, :id, :product_id, :text
  json.url review_url(review, format: :json)
end
