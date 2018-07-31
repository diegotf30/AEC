class Member < ApplicationRecord
  has_many :groups

  devise :database_authenticatable, :validatable, :registerable, :recoverable,
         :rememberable, :trackable, :confirmable, :lockable

  validates :name, length: { maximum: 50 }, allow_blank: true
  validates :phone, uniqueness: true, allow_blank: true, allow_nil: true
  validates :gender, inclusion: ['male', 'female'], allow_blank: true, allow_nil: true
  # validates :auth_uid, uniqueness: true, allow_nil: true, allow_blank: true

  def verify
    update(confirmed_at: Time.current)
  end

  def verified?
    !!confirmed_at
  end

  def active?
    status == 'active'
  end

  def inactive?
    status == 'inactive'
  end
end
