class CreateApproverUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :approver_users do |t|
      t.integer :approver_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
