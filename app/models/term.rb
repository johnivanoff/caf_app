class Term < ActiveRecord::Base
  belongs_to :position
  belongs_to :member
  attr_accessible :position_id, :member_id, :term_end, :term_start

  validates :position_id, :member_id, :term_end, :term_start, :presence => true, :on => :create


  scope :ordered, order("terms.position_id ASC") 

  scope :current, lambda {
    where ("terms.term_start IS NOT NULL AND terms.term_start < ? AND terms.term_end > ? "), (Date.today), (Date.today)
    }
  scope :past, lambda {
    where ("terms.term_start IS NOT NULL AND terms.term_end < ? "), (Date.today)
    }

  scope :time_ordered, order("terms.term_start DESC") 

  scope :hof, where("terms.position_id = 2")

  scope :alpha_order, joins(:member).merge(Member.ordered)

end
