class AddPageIdToLinks < ActiveRecord::Migration
  def change
    add_column :links, :page_id, :integer
  end
end
