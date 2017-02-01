class Location < ActiveRecord::Base
  attr_accessible :address, :airport_name, :city, :description, :icao_identifier, :latitude, :location_name, :location_name_short, :longitude, :postal_code, :state

  has_many :events
  
end
