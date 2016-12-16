class Unit < ActiveRecord::Base
  has_many :aircrafts
  has_many :members, :through => :unit_assignments
  attr_accessible :address_1, :address_2, :author_username, :city, :description, :facebook, :museum, :postal_code, :primary_email, :primary_phone, :state, :twitter, :unit_name, :website, :unit_logo

  has_paper_trail :class_name => 'UnitVersion',
     :meta => { :author_username => :user_name}

  scope :alpha_order, order("unit_name ASC")
end
