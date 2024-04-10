class CreatePurchaseOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :purchase_order_items do |t|
      t.text :item_desctiption
      t.string :hsn_code
      t.string :qty
      t.string :unit
      t.string :basic_price
      t.string :total_amount
      t.references :purchase_order
      t.timestamps
    end
  end
end
