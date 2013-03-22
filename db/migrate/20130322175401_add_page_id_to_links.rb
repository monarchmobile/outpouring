class AddPageIdToLinks < ActiveRecord::Migration
  def change
  	remove_column :links, :page_id
    add_column :links, :page_id, :integer
  end
end
