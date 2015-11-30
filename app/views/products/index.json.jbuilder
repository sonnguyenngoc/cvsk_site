json.array!(@products) do |product|
  json.extract! product, :id, :image_url, :name, :price, :category_id, :manufacturer_id, :description
  json.url product_url(product, format: :json)
end
