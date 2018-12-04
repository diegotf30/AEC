class CreateJoinTableGroupMember < ActiveRecord::Migration[5.1]
  def change
    create_join_table :groups, :members do |t|
      t.index [:group_id, :member_id]
      t.index [:member_id, :group_id]
    end

    remove_reference :members, :group
  end
end
