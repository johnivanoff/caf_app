class HqPosition < ActiveRecord::Base
  attr_accessible :description, :position_name
  has_many :hq_position_assignments
  has_many :members, :through => :hq_position_assignments

  scope :alpha_order, order("position_name ASC")
end
