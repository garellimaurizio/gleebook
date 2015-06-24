class CreateFavoriteThoughts < ActiveRecord::Migration
  def change
    create_table :favorite_thoughts do |t|
      t.integer :user_id
      t.integer :thought_id

      t.timestamps null: false
    end
    
    add_index :favorite_thoughts, :user_id
    add_index :favorite_thoughts, :thought_id
    add_index :favorite_thoughts, [:user_id, :thought_id], unique: true
    
  end
end
