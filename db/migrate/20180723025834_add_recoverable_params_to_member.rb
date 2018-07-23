class AddRecoverableParamsToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :reset_password_token, :string
    add_column :members, :reset_password_sent_at, :datetime
    add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true, using: :btree
  end
end
