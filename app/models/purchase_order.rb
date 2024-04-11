class PurchaseOrder < ApplicationRecord

	has_many :purchase_order_items
	accepts_nested_attributes_for :purchase_order_items, allow_destroy: true, reject_if: :all_blank
	has_rich_text :site_address
	has_rich_text :billing_address
	has_rich_text :payment_terms
	has_rich_text :vender_detail

	attr_accessor :comments
	enum status: %w[pending approve cancel], _default: "pending"

	after_initialize :set_po_number

	scope :pending_po, ->{where(status: "pending")}
	scope :approved_po, ->{where(status: "approve")}
	scope :canceled_po, ->{where(status: "cancel")}

	def set_po_number
		unless self.po_number
			self.po_number = "PO/#{DateTime.now.to_i}/#{rand(15)}"
		end
	end
end
