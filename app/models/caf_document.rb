class CafDocument < ActiveRecord::Base
  belongs_to :document_category
  attr_accessible :body, :current, :description, :document_category_id, :file_url, :image_url, :published_date, :title
end
