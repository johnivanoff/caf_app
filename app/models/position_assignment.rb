class PositionAssignment < ActiveRecord::Base
  belongs_to :hq_position
  belongs_to :member
  attr_accessible :member_id, :hq_position_id, :assignment_end, :assignment_start, :notes


  scope :hq_staff, where('hq_position_id != "33"') 

  scope :general_staff, where('hq_position_id = "33"')

end
