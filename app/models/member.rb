class Member < ApplicationRecord
  belongs_to :group
  belongs_to :member, foreign_key: 'leader_id'

  has_one :member, foreign_key: 'dependent_id'

  devise :database_authenticatable, :validatable, :registerable, :recoverable, :rememberable

  validates :name, length: { maximum: 50 }
  validates :phone, uniqueness: true, allow_nil: true, allow_blank: true
  validates :gender, inclusion: ['male', 'female'], allow_blank: true, allow_nil: true
  # validates :auth_uid, uniqueness: true, allow_nil: true, allow_blank: true
end
