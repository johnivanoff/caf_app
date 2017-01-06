class CreateUnitTypes < ActiveRecord::Migration
  def change
    create_table :unit_types do |t|
      t.string :type_name
      t.text :description

      t.timestamps
    end
  end
end
