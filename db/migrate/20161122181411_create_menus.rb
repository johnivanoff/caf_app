class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :parent_id
      t.string :display
      t.string :url
      t.integer :position

      t.timestamps
    end
  end
end
