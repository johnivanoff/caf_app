class CreateAircraftTypes < ActiveRecord::Migration
  def change
    create_table :aircraft_types do |t|
      t.references :aircraft_class
      t.string :type
      t.text :description
      t.string :manufacturer
      t.string :introduced
      t.string :production_years
      t.string :role
      t.string :power
      t.string :length
      t.string :height
      t.string :wingspan
      t.string :empty_weight
      t.string :gross_weight
      t.string :max_weight
      t.string :range
      t.string :max_speed
      t.string :cruise_speed
      t.string :ceiling
      t.string :crew
      t.string :guns
      t.string :hardpoints
      t.string :rockets
      t.string :bombs
      t.string :fuel_capacity
      t.string :fuel_burn
      t.string :oil_capacity
      t.string :qty_produced
      t.string :cost
      t.string :qty_still_flying

      t.timestamps
    end
    add_index :aircraft_types, :aircraft_class_id
  end
end
