class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :unit_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :primary_phone
      t.string :primary_email
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
