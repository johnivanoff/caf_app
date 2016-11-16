class AircraftType < ActiveRecord::Base
  belongs_to :aircraft_class
  attr_accessible :aircraft_class_id, :bombs, :ceiling, :cost, :crew, :cruise_speed, :description, :empty_weight, :fuel_burn, :fuel_capacity, :gross_weight, :guns, :hardpoints, :height, :introduced, :length, :manufacturer, :max_speed, :max_weight, :oil_capacity, :power, :production_years, :qty_produced, :qty_still_flying, :range, :rockets, :role, :aircraft_type, :wingspan
end
