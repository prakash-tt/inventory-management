class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.references :user

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :title, unique: true
  end
end
