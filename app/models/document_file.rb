class DocumentFile < ActiveRecord::Base
  belongs_to :caf_documents
  attr_accessible :filename, :title
end
