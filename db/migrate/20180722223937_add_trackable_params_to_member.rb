class AddTrackableParamsToMember < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string "current_sign_in_ip", limit: 255
      t.string "last_sign_in_ip", limit: 255
      t.integer "sign_in_count", default: 0, null: false
    end
  end
end
