class AddIndexToPages < ActiveRecord::Migration
  def change
    add_column :pages, :index, :integer
  end
end
