class Area < ApplicationRecord
  has_many :shops
  validates :name, presence: true
end
