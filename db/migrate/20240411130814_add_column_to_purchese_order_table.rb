class AddColumnToPurcheseOrderTable < ActiveRecord::Migration[7.1]
  def change
     add_column :purchase_orders, :user_id, :integer
     add_column :purchase_orders, :project_id, :integer
     add_column :purchase_orders, :department_id, :integer

     add_index :purchase_orders, :user_id
     add_index :purchase_orders, :project_id
     add_index :purchase_orders, :department_id


  end
end
