class RemoveColumnsFromLinks < ActiveRecord::Migration
  def up
  	remove_column :links, :no_link
  	remove_column :links, :side_link
  	remove_column :links, :top_link
  	add_column :links, :location, :string
  end

  def down

  end
end
