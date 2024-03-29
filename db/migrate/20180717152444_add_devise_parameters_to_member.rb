class AddDeviseParametersToMember < ActiveRecord::Migration[5.1]
  def change
    change_table :members do |t|
      # Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email
      t.string   :email
      t.string   :encrypted_password, default: ''
      # Lockable
      t.integer  :failed_attempts, default: 0, null: false
      t.string   :unlock_token
      t.datetime :locked_at
    end

    add_index :members, :confirmation_token, unique: true
    add_index :members, :unlock_token, unique: true
  end
end
