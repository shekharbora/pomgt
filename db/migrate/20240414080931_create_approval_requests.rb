class CreateApprovalRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :approval_requests do |t|
      t.integer :approver_id
      t.references :user, null: false, foreign_key: true
      t.references :purchase_order, null: false, foreign_key: true
      t.integer :status, default: 0
      t.text :comment
      t.timestamps
    end
  end
end
