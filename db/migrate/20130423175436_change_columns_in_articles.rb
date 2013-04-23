class ChangeColumnsInArticles < ActiveRecord::Migration
  def up
  	remove_column :articles, :published
  	remove_column :articles, :schedule_in
  	remove_column :articles, :schedule_out
  	add_column :articles, :starts_at, :date
  	add_column :articles, :ends_at, :date
  	add_column :articles, :current_state, :integer
  	add_column :articles, :position, :integer
  end

  def down
  end
end

