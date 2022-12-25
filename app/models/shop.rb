class Shop < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :area, optional: true
  belongs_to :account, optional: true
  has_many :menus, dependent: :destroy
  has_many :genres, through: :menus
  has_many :favorites, dependent: :destroy
  has_many :users, through: :shops
  has_many_attached :main_images
  has_many_attached :images
  
  validates :name, presence: true
  validates :area_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
  validates :business_hours, presence: true
  validates :category_id, presence: true
  validates :catch_copy, length: { maximum: 30 }
  validates :description, length: { maximum: 200 }
  validate :main_images_length
  
  def self.search(keyword = nil, category_id = nil, area_id = nil)
    shops = Shop.order(created_at: :desc)
    shops = shops.where('name LIKE :keyword OR catch_copy LIKE :keyword OR description LIKE :keyword', keyword: "%#{keyword}%" ) if keyword.present?
    shops = shops.where(category_id: category_id) if category_id.present?
    shops = shops.where(area_id: area_id) if area_id.present?
    shops
  end
  
  private
  
    def main_images_length
      if main_images.length > 5
        main_images.purge
        errors.add(:main_images, "は5枚以内にしてください")
      end
    end

end