class Country < ApplicationRecord
  has_many :cities

  validates :name, length: { maximum: 50 }
end
