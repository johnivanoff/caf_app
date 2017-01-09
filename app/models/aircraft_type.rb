class AircraftType < ActiveRecord::Base
  has_and_belongs_to_many :aircraft_classes
  has_one :aircraft
  attr_accessible :aircraft_class_id, :aircraft_name, :bombs, :ceiling, :cost, :crew, :cruise_speed, :description, :empty_weight, :fuel_burn, :fuel_capacity, :gross_weight, :guns, :hardpoints, :height, :introduced, :length, :manufacturer, :max_speed, :max_weight, :oil_capacity, :power, :production_years, :qty_produced, :qty_still_flying, :range, :rockets, :role, :aircraft_type_designation, :wingspan

  has_paper_trail :class_name => 'AircraftTypeVersion',
     :meta => { :author_username => :user_name}

end
