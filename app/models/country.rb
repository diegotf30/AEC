class Country < ApplicationRecord
  has_many :cities
  has_many :sectors, through: :cities
  has_many :groups, through: :sectors
  has_many :members, through: :groups

  validates :name, length: { maximum: 50 }
end
