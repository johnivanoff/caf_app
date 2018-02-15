class ContentCategory < ActiveRecord::Base
  attr_accessible :category_name, :description

  scope :home, where('category_name = "Home"')
  scope :member_home, where('category_name = "Member Home"')

end
