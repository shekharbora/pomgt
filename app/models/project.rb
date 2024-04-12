class Project < ApplicationRecord

  has_many :purchase_orders


  def self.ransackable_attributes(auth_object = nil)
    ["address", "created_at", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["purchase_orders"]
  end

  def to_s
    self.id
  end 
end
