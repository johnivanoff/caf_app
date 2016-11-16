class CreateAircrafts < ActiveRecord::Migration
  def change
    create_table :aircrafts do |t|
      t.string :name
      t.string :n_number
      t.text :description
      t.string :nose_art
      t.references :aircraft_type_id

      t.timestamps
    end
    add_index :aircrafts, :aircraft_type_id_id
  end
end
