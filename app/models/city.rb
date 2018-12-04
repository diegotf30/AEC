class City < ApplicationRecord
  belongs_to :country
  has_many :sectors

  validates :name, length: { maximum: 50 }

  def destroy_with_children
    sectors.each do |s|
      s.groups.each do |s_g|
        s_g.attendances.each do |g_a|
          g_a.destroy
        end
        s_g.destroy
      end
      s.destroy
    end
    destroy!
  end
end
