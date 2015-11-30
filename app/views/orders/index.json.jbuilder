json.array!(@orders) do |order|
  json.extract! order, :id, :type_id, :customer_name, :customer_email, :customer_phone, :many_people, :order_date, :message
  json.url order_url(order, format: :json)
end
