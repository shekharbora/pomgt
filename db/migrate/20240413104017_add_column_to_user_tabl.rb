class AddColumnToUserTabl < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :designation, :string
    add_column :users, :department_id, :integer

  end
end
