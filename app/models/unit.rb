class Unit < ActiveRecord::Base
  has_many :aircrafts
  has_many :social_links
  has_many :members, :through => :unit_assignments
  has_many :social_links, :dependent => :destroy
  attr_accessible :address_1, :address_2, :author_username, :city, :description, :facebook, :museum, :postal_code, :primary_email, :primary_phone, :state, :unit_name, :website, :unit_logo, :social_links_attributes

  accepts_nested_attributes_for :social_links
  
  has_paper_trail :class_name => 'UnitVersion',
     :meta => { :author_username => :user_name}

  scope :alpha_order, order("unit_name ASC")
end
