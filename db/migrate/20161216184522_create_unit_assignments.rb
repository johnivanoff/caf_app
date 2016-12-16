class CreateUnitAssignments < ActiveRecord::Migration
  def change
    create_table :unit_assignments do |t|
      t.references :member
      t.references :unit

      t.timestamps
    end
    add_index :unit_assignments, :member_id
    add_index :unit_assignments, :unit_id
  end
end
