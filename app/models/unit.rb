class Unit < ActiveRecord::Base
  has_many :aircrafts
  attr_accessible :address_1, :address_2, :city, :description, :postal_code, :primary_email, :primary_phone, :state, :unit_name, :website
end
