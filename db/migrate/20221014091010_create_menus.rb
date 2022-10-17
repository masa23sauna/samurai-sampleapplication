class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
