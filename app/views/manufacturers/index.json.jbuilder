json.array!(@manufacturers) do |manufacturer|
  json.extract! manufacturer, :id, :image_url, :name, :address, :phone, :email, :intro
  json.url manufacturer_url(manufacturer, format: :json)
end
