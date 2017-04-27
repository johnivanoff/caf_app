class CafDocument < ActiveRecord::Base
  belongs_to :document_category
  attr_accessible :body, :current, :description, :document_category_id, :file_url, :image_url, :published_date, :title, :toc

  scope :category_ordered, joins(:document_category).merge(DocumentCategory.ordered)
  scope :ordered, order("caf_documents.title ASC")

end
