class ContentType < ActiveRecord::Base
  attr_accessible :description, :type_name

  scope :pages, where('type_name = "Pages"')
  scope :news, where('type_name = "News"')
  scope :blogs, where('type_name = "Blogs"')
  
end
