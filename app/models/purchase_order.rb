class PurchaseOrder < ApplicationRecord

	
	has_many :purchase_order_items
	accepts_nested_attributes_for :purchase_order_items, allow_destroy: true, reject_if: :all_blank
	has_rich_text :billing_address
	has_rich_text :payment_terms
	has_rich_text :vender_detail
	has_rich_text :comment

	after_commit :generate_request

	belongs_to :project
	belongs_to :department
	belongs_to :user


	has_many :approval_requests

	validates :po_number, presence: true, uniqueness: true

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

	#active Admin
	def self.ransackable_attributes(auth_object = nil)
	  ["billing_address", "comment", "contact_person", "contact_person_designation", "contact_person_email", "contact_person_phone", "created_at", "department_id", "group", "gst_no", "gst_per", "id", "id_value", "payment_terms", "po_number", "project", "project_id", "site_address", "status", "total_amount", "updated_at", "user_id", "vender_detail"]
	end

	def self.ransackable_associations(auth_object = nil)
	  ["department", "project", "purchase_order_items", "rich_text_billing_address", "rich_text_comment", "rich_text_payment_terms", "rich_text_site_address", "rich_text_vender_detail", "user"]
	end
	def to_s
	  self.po_number
	end


	def generate_request
		approval_requests.create(user_id: self.user_id,approver_id: self.user&.approver_users&.last&.id)
	end
	
end
