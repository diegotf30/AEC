class AddPresenceToAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :presence, :boolean, default: true
  end
end
