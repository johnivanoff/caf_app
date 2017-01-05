class SocialLink < ActiveRecord::Base
  belongs_to :units
  belongs_to :social_brand
  attr_accessible :brand_url, :id, :social_brand_id, :unit_id
end
