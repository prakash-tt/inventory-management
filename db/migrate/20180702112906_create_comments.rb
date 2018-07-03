class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, null: false
      t.references :post, null: false

      t.timestamps
    end

    change_column_null :posts, :user_id, false

    add_index :comments, :user_id
    add_index :comments, :post_id
  end
end
