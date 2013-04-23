class AddColumnsToPage < ActiveRecord::Migration
  def change
  	remove_column :pages, :published
  	remove_column :pages, :index
  	add_column :pages, :starts_at, :date
  	add_column :pages, :ends_at, :date
  	add_column :pages, :current_state, :integer
  	add_column :pages, :position, :integer
  end
end
