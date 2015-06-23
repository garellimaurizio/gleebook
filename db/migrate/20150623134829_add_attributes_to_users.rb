class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sex, :string
    add_column :users, :birthday, :date
  end
end
