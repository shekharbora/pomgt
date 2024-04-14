class ApprovalRequest < ApplicationRecord
  belongs_to :user
  belongs_to :purchase_order

  enum status: %w[pending approve cancel], _default: "pending"

end
