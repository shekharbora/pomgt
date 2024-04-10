json.extract! purchase_order, :id, :part_name, :part_number, :category_name, :queantity, :quantity, :quantity_unit, :created_at, :updated_at
json.url purchase_order_url(purchase_order, format: :json)
