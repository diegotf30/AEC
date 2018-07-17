class Group < ApplicationRecord
  belongs_to :sector
  has_many :members

  DAYS = %w[ lun mar mie jue vie sab dom ].freeze

  validates :name, length: { maximum: 50 }
  validates :phone, uniqueness: true, allow_nil: true, allow_blank: true
  validates :day, inclusion: { in: DAYS }
  validates :hour, length: { maximum: 5 }
end
