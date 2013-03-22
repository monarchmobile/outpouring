class AddColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :published, :boolean
    add_column :articles, :schedule_in, :date
    add_column :articles, :schedule_out, :date
  end
end
