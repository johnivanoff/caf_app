class CreatePositionAssignments < ActiveRecord::Migration
  def change
    create_table :position_assignments do |t|
      t.references :position
      t.references :member
      t.date :assignment_start
      t.date :assignment_end
      t.text :notes

      t.timestamps
    end
    add_index :position_assignments, :position_id
    add_index :position_assignments, :member_id
  end
end
