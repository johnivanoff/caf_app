class CreateSocialLinks < ActiveRecord::Migration
  def change
    create_table :social_links do |t|
      t.references :unit
      t.string :social_brand
      t.string :brand_url

      t.timestamps
    end
    add_index :social_links, :unit_id
  end
end
