class AddColumnToPurcheseOrder < ActiveRecord::Migration[7.1]
  def change
    add_column :purchase_orders, :vender_detail, :text
    add_column :purchase_orders, :group, :string
    add_column :purchase_orders, :contact_person_designation, :string
    add_column :purchase_orders, :contact_person_email, :string
    add_column :purchase_orders, :project, :string
  end
end
