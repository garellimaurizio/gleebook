class AddSlugToThoughts < ActiveRecord::Migration
  
  def change
	  add_column :thoughts, :slug, :string
  end

end
