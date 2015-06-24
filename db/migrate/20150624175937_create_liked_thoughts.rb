class CreateLikedThoughts < ActiveRecord::Migration
  def change
    create_table :liked_thoughts do |t|
      t.integer :user_id
      t.integer :thought_id

      t.timestamps null: false
    end
    
    add_index :liked_thoughts, :user_id
    add_index :liked_thoughts, :thought_id
    add_index :liked_thoughts, [:user_id, :thought_id], unique: true
    
  end
end
