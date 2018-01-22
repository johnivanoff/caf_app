class CreateDocumentFiles < ActiveRecord::Migration
  def change
    create_table :document_files do |t|
      t.string :title
      t.string :filename
      t.references :caf_documents

      t.timestamps
    end
    add_index :document_files, :caf_documents_id
  end
end
