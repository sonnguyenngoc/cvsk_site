json.array!(@slide_shows) do |slide_show|
  json.extract! slide_show, :id, :image_url, :title_1, :title_2, :description
  json.url slide_show_url(slide_show, format: :json)
end
