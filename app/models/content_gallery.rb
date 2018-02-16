class ContentGallery < ActiveRecord::Base
  attr_accessible :caption, :image, :photographer

  mount_uploader :image, ImageUploader
  
end
