class HqPositionAssignment < ActiveRecord::Base
  belongs_to :member
  belongs_to :hq_position

  attr_accessible :hq_position_id, :member_id

  scope :ordered, joins(:hq_position).merge(HqPosition.alpha_order)

end
