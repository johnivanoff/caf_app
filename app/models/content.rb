class Content < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :content_type_id, :content_category_id, :feature_image, :published_at, :slug, :title, :user_id

  belongs_to :content_category
  belongs_to :content_type

  has_paper_trail :class_name => 'ContentVersion',
     :meta => { :author_username => :user_name}

#  validates_presence_of :slug

#  def to_param
#    "#{id}-#{slug}"
#  end
  
# Content Type association definitions
  scope :pages, joins(:content_type).merge(ContentType.pages)
  scope :news, joins(:content_type).merge(ContentType.news)
  scope :blogs, joins(:content_type).merge(ContentType.blogs)
  
# Content Category association definitions
  scope :home, joins(:content_category).merge(ContentCategory.home)
  scope :member_home, joins(:content_category).merge(ContentCategory.member_home)

  scope :categorize, order("contents.content_category_id ASC")
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