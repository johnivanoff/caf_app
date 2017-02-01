class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :event_start
      t.datetime :event_end
      t.string :event_title
      t.string :event_statuses_id
      t.integer :location_id
      t.string :event_URL
      t.string :contact_info
      t.text :details
      t.string :graphic_address

      t.timestamps
    end
  end
end
