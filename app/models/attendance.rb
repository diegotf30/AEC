class Attendance < ApplicationRecord
  belongs_to :group
  belongs_to :member

  before_create :check_if_day_has_passed

  # Since Heroku cant change files, each day we create a checkpoint
  def self.checkpoint
    Attendance.find_by(checkpoint: true).order(:created_at).last
  end

  private

  def check_if_day_has_passed
    unless (Attendance.checkpoint.created_at - member.last_attendance.created_at) / 1.hour > 24
      errors.add(:base, 'Solo pueden atender una vez por dia')
    end
  end
end
