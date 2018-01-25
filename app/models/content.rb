class Content < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :content_type_id, :content_category_id, :feature_image, :published_at, :slug, :title, :user_id

  belongs_to :content_category

  has_paper_trail :class_name => 'ContentVersion',
     :meta => { :author_username => :user_name}

#  validates_presence_of :slug

#  def to_param
#    "#{id}-#{slug}"
#  end
  
  scope :pages, where("content_type_id = 1")
  scope :home, where("contents.content_category_id = 11")
  scope :categorize, order("contents.content_category_id ASC")
  
  scope :news, where("content_type_id = 2")
  scope :tease, :limit => 4
  scope :reverse, order("contents.published_at DESC")


# Content category ids
#
# 1 = About
# 2 - Education
# 3 - Members
# 4 - Contact
# 5 - Development
# 6 - Membership

end
