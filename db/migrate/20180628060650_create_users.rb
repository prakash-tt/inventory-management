class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :null => false, :limit => 30
      t.string :email, :null => false
      t.string :password_digest, :null => false
      t.boolean :is_admin, :null => false, :default => false

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
