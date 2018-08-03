class AddMembersOnlyToContents < ActiveRecord::Migration
  def change
    add_column :contents, :members_only, :boolean
  end
end
