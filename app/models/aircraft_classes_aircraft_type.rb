class AircraftClassesAircraftType < ActiveRecord::Base

has_and_belongs_to_many :aircraft_types

end
