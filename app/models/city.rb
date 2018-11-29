class City < ApplicationRecord
  belongs_to :country
  has_many :sectors

  validates :name, length: { maximum: 50 }
end
