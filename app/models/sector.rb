class Sector < ApplicationRecord
  belongs_to :city
  has_many :groups
  has_many :members, through: :groups

  validates :name, length: { maximum: 50 }
end
