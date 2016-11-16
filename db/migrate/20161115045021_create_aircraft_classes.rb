class CreateAircraftClasses < ActiveRecord::Migration
  def change
    create_table :aircraft_classes do |t|
      t.string :class_type
      t.text :description

      t.timestamps
    end
  end
end
