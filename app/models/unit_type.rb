class UnitType < ActiveRecord::Base
  has_many :units
  attr_accessible :description, :type_name
end
