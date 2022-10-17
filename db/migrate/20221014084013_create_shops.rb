class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.decimal :latitude, :precision => 9, :scale => 6
      t.decimal :longitude, :precision => 9, :scale => 6
      t.integer :popularity
      t.string :name,  null: false
      t.string :thumbnail
      t.string :city, null: false
      t.text :address, null: false
      t.text :catch_copy, null: false
      t.text :description, null: false
      t.string :telephone, null: false
      t.string :business_hours, null: false

      t.timestamps
    end
  end
end
