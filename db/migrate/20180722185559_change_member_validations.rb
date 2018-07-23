class ChangeMemberValidations < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      t.change :name, :string, null: true
      t.change :phone, :string, null: true
      t.change :email, :string, null: false, default: ""
      t.change :encrypted_password, :string, null: false, default: ""
      t.index ["email"], name: "index_members_on_email", unique: true
    end
  end
end
