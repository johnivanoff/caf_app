class DocumentCategory < ActiveRecord::Base
  attr_accessible :category_name, :description
  has_many :squadron_documents

  scope :ordered, order("document_categories.category_name ASC")
end
