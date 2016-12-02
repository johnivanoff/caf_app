class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.references :user
      t.datetime :published_at

      t.timestamps
    end
    add_index :contents, [:user_id, :title, :slug]
  end
end
