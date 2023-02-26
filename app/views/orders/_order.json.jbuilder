json.extract! order, :id, :merchant_id, :status, :amount, :comission_percentage, :created_at, :updated_at
json.url order_url(order, format: :json)
