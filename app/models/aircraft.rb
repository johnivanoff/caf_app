class Aircraft < ActiveRecord::Base
  belongs_to :aircraft_type
  attr_accessible :aircraft_type_id, :description, :n_number, :name, :nose_art
end
