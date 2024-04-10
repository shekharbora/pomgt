class CreatePurchaseOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_orders do |t|
      t.string :po_number
      t.text :billing_address
      t.string :gst_no
      t.text :payment_terms
      t.text :site_address
      t.string :contact_person
      t.string :contact_person_phone
      t.string :gst_per
      t.string :total_amount
      t.integer :status
      t.text    :comment
      t.timestamps
    end
  end
end
