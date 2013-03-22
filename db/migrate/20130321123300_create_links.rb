class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.boolean :top_link, :default => false
      t.boolean :side_link, :default => false
      t.boolean :no_link, :default => false

      t.timestamps
    end
  end
end
