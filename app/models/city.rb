class City < ApplicationRecord
  belongs_to :country
  has_many :sectors
  has_many :groups, through: :sectors
  has_many :members, through: :groups

  validates :name, length: { maximum: 50 }
end
