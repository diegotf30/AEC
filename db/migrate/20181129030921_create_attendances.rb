class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.references :group, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
