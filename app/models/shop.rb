class Shop < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :area, optional: true
  belongs_to :account, optional: true
  has_many :menus, dependent: :destroy
  has_many :genres, through: :menus
  has_many :favorites, dependent: :destroy
  has_many :users, through: :shops
  has_many_attached :main_images do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end
  
  validates :name, presence: true
  validates :area_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :telephone, presence: true
  validates :business_hours, presence: true
  validates :category_id, presence: true
  validates :catch_copy, length: { maximum: 30 }
  validates :description, length: { maximum: 200 }
end