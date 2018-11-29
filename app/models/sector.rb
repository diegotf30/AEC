class Sector < ApplicationRecord
  belongs_to :city
  has_many :groups

  validates :name, length: { maximum: 50 }
end
