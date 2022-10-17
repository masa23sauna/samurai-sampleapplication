class Genre < ApplicationRecord
  has_many :menus
    has_many :shops, through: :menus
end
