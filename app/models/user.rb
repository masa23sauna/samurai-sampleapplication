class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :validatable
         
  has_many :favorites, dependent: :destroy
    has_many :shops, through: :favorites
    
  def already_liked?(shop)
    self.favorites.exists?(shop_id: shop.id)
  end
  
end
