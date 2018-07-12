class Location < ActiveRecord::Base
  attr_accessible :address, :airport_name, :city, :description, :icao_identifier, :latitude, :location_name, :location_name_short, :longitude, :postal_code, :state

  has_many :events
  
  def combined_value
    "#{self.location_name_short} | #{self.icao_identifier}, #{self.city}  #{self.state}"
  end
  
  scope :ordered, order("locations.location_name_short ASC")

end
