json.array!(@posts) do |post|
  json.extract! post, :id, :tag_id, :title, :content, :general_benefit
  json.url post_url(post, format: :json)
end
