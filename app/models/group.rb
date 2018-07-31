class Group < ApplicationRecord
  belongs_to :sector
  has_many :members
  has_one :member, foreign_key: 'leader_id'
  has_one :member, foreign_key: 'dependent_id'

  DAYS = %w[ lun mar mie jue vie sab dom ].freeze

  validates :name, length: { maximum: 50 }
  validates :phone, uniqueness: true, allow_nil: true, allow_blank: true
  validates :day, inclusion: { in: DAYS }
  validates :hour, length: { maximum: 5 }

  def leader
    Member.find_by(id: leader_id)
  end

  def dependent
    Member.find_by(id: dependent_id)
  end

  def add_member(member)
    members << member
  end

  def inactive?
    !active?
  end

  def disable
    unless inactive?
      update_attributes! active: false
    end
  end

  def enable
    unless active?
      update_attributes! active: true
    end
  end
end
