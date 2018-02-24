class Member < ActiveRecord::Base
  attr_accessible :user_id, :author_username, :caf_col_no, :caf_join_date, :cell_phone, :city, :email, :first_name, :home_phone, :last_name, :photo, :state, :street_1, :street_2, :work_phone, :zip, :user_attributes
  has_many :unit_assignments
  has_many :units, :through => :unit_assignments, :dependent => :destroy
  has_many :hq_position_assignments
  has_many :hq_positions, :through => :hq_position_assignments, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :user, :allow_destroy => true

  has_many :terms
  has_many :positions, :through => :terms

  validates :first_name, :last_name, :presence => true, :on => :create

  has_paper_trail :class_name => 'MemberVersion',
     :meta => { :author_username => :user_name}
  #   meta: { author_username: :user_name}

  mount_uploader :photo, PhotoUploader

#  scope :active, where("members.active = 1")
#  scope :inactive, where("members.active = 0")

  scope :ordered, order("members.last_name ASC, members.first_name ASC")

  scope :gs_staff, joins(:positions).merge(Position.gs_staff)



#  scope :hq_staff, where('id = 1')

#  scope :dues_most_recent, joins(:dues_payments).merge(DuesPayment.ordered)
  
#  scope :dues_current, joins(:dues_payments).merge(DuesPayment.current)

#  scope :dues_past, joins(:dues_payments).merge(DuesPayment.past_due)
  
  def full_name
    self.last_name + ', ' + self.first_name
  end


end
