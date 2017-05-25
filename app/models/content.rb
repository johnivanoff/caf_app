class Content < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :published_at, :slug, :title, :user_id

  scope :news, where("content_type_id = 2")
  scope :tease, :limit => 4
  scope :reverse, order("contents.published_at DESC")

end
