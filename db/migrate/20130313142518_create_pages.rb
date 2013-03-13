class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.boolean :published, :default => false
      t.string :slug

      t.timestamps
    end
  end
end
