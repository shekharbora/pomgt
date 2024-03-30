class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :question
      t.text :answer
      t.integer :view_count
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
