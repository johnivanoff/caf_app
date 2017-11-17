class AircraftClass < ActiveRecord::Base
  attr_accessible :class_type, :description, :type_picture
  
  has_and_belongs_to_many :aircraft_types
  has_many :aircraft, :through => :aircraft_types

  scope :bomber, where('id = 1')

end
