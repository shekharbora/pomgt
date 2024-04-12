class PurchaseOrderItem < ApplicationRecord
	  # belongs_to :purchase_order


 def self.ransackable_attributes(auth_object = nil)
    ["basic_price", "created_at", "hsn_code", "id", "id_value", "item_desctiption", "purchase_order_id", "qty", "total_amount", "unit", "updated_at"]
  end
end
