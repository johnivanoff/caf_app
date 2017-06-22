class CreateCafDocuments < ActiveRecord::Migration
  def change
    create_table :caf_documents do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :file_url
      t.string :image_url
      t.date :published_date
      t.boolean :current
      t.references :document_category

      t.timestamps
    end
    add_index :caf_documents, :document_category_id
  end
end
