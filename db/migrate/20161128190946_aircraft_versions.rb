class AircraftVersions < ActiveRecord::Migration
  def change
    create_table :aircraft_versions do |t|
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.string   :author_username
      t.datetime :created_at
    end
    add_index :aircraft_versions, [:item_type, :item_id]
  end
end
