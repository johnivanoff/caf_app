class SocialLink < ActiveRecord::Base
  belongs_to :units
  belongs_to :social_brand
  attr_accessible :id, :brand_url, :social_brand_id, :unit_id, :created_at, :updated_at
end