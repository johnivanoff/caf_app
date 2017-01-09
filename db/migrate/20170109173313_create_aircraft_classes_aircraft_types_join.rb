class CreateAircraftClassesAircraftTypesJoin < ActiveRecord::Migration

  def up
    create_table :aircraft_classes_aircraft_types, :id => false do |t|
      t.integer "aircraft_class_id"
      t.integer "aircraft_type_id"
    end
    add_index :aa, ["aircraft_class_id", "aircraft_type_id"]
  end

  def down
    drop_table :aircraft_classes_aircraft_types
  end

end