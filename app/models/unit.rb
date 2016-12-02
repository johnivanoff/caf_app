class Unit < ActiveRecord::Base
  has_many :aircrafts
  attr_accessible :address_1, :address_2, :author_username, :city, :description, :postal_code, :primary_email, :primary_phone, :state, :unit_name, :website

  has_paper_trail :class_name => 'UnitVersion',
     :meta => { :author_username => :user_name}
end
