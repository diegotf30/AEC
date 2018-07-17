class RenameTypeInGroups < ActiveRecord::Migration[5.1]
  def change
    rename_column :groups, :type, :context
  end
end
