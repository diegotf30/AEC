class AddAdminToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :admin, :boolean, default: false
  end
end
