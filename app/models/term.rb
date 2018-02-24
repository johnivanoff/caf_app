class Term < ActiveRecord::Base
  belongs_to :position
  belongs_to :member
  attr_accessible :position_id, :member_id, :term_end, :term_start

  scope :ordered, order("terms.position_id ASC") 
  scope :current, lambda {
    where ("terms.term_start IS NOT NULL AND terms.term_start < ? AND terms.term_end > ? "), (Date.today), (Date.today)
    }
  scope :past, lambda {
    where ("terms.term_start IS NOT NULL AND terms.term_end < ? "), (Date.today)
    }
  scope :time_ordered, order("terms.term_start DESC") 


end
