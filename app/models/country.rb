class Country < ApplicationRecord
  has_many :cities

  validates :name, length: { maximum: 50 }

  def delete_with_children
    cities.each do |c|
      c.destroy_with_children
    end

    destroy!
  end
end
