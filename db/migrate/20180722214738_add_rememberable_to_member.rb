class AddRememberableToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :remember_created_at, :datetime
  end
end
