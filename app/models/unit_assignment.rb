class UnitAssignment < ActiveRecord::Base
  belongs_to :member
  belongs_to :unit
  # attr_accessible :title, :body
end
