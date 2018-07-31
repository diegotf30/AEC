class AddAttendanceToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :attendance, :boolean, default: false
  end
end
