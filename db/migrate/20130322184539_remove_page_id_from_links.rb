class RemovePageIdFromLinks < ActiveRecord::Migration
  def up
  	remove_column :links, :page_id
  end

  def down
  end
end
