class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :title
      t.text :content
      t.integer :like_counter
      t.integer :visit_counter

      t.timestamps null: false
    end
  end
end
