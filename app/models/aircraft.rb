class Aircraft < ActiveRecord::Base
  belongs_to :aircraft_type
  belongs_to :unit
  attr_accessible :aircraft_type_id, :description, :n_number, :name, :nose_art

  has_paper_trail :class_name => 'AircraftVersion',
     :meta => { :author_username => :user_name}

end
