class Content < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :published_at, :slug, :title, :user_id

  validates_presence_of :slug

  def to_param
    "#{id}-#{slug}"
  end
  
end
