class CreateContentGalleries < ActiveRecord::Migration
  def change
    create_table :content_galleries do |t|
      t.string :image
      t.text :caption
      t.string :photographer

      t.timestamps
    end
  end
end
