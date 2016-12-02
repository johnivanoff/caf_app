class Content < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :published_at, :slug, :title, :user_id
end
