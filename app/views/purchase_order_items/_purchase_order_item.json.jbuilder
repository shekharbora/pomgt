json.extract! purchase_order_item, :id, :item_desctiption, :hsn_code, :qty, :unit, :basic_price, :total_amount, :created_at, :updated_at
json.url purchase_order_item_url(purchase_order_item, format: :json)
