class Shop < ApplicationRecord
  belongs_to :genre
  belongs_to :area
  belongs_to :account
  has_many :menus, dependent: :destroy
  has_many :genres, through: :menus
  has_many :favorites, dependent: :destroy
  has_many :users, through: :shops
  has_many :images, dependent: :destroy
end
