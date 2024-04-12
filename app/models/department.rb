class Department < ApplicationRecord

  has_many :purchase_orders

  def self.ransackable_attributes(auth_object = nil)
       ["code", "created_at", "description", "id", "id_value", "updated_at", "purchase_orders"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["purchase_orders"]
  end
  
end
