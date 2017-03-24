class HqPositionAssignment < ActiveRecord::Base
  belongs_to :member
  belongs_to :hq_position
  # attr_accessible :title, :body
end
