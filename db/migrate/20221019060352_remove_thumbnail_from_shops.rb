class RemoveThumbnailFromShops < ActiveRecord::Migration[7.0]
  def change
    remove_column :shops, :thumbnail, :string
  end
end
