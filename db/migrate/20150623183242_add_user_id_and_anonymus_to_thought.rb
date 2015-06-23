class AddUserIdAndAnonymusToThought < ActiveRecord::Migration
  def change
	  add_column :thoughts, :user_id, :integer
	  add_column :thoughts, :anonymus, :boolean, :default => false
  end
end
