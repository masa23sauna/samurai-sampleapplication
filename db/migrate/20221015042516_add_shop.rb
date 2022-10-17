class AddShop < ActiveRecord::Migration[7.0]
  def change
    add_reference :shops, :category, foreign_key: true
    add_reference :shops, :area, foreign_key: true
    add_reference :shops, :account, foreign_key: true
    
  end
end
