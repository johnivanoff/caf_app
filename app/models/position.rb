class Position < ActiveRecord::Base
  attr_accessible :description, :position_name

  has_many :terms
  has_many :members, :through => :terms

  scope :gs_staff, where('position_name = "General Staff"')
  scope :hof_member, where('position_name = "Hall of Fame"')
  scope :hq_staff, where('position_name = "General Staff"')

end
