class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
#  attr_accessible :title, :body

  validates_uniqueness_of :email

  has_one :member, :dependent => :destroy
  has_many :assignments, :dependent => :destroy
  accepts_nested_attributes_for :assignments

  has_many :roles, :through => :assignments

  has_paper_trail :class_name => 'UserVersion',
     :meta => { :author_username => :user_name}


  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  scope :member_ordered, joins(:member).merge(Member.ordered)

  def self.find_version_author(version)
    find(version.terminator)   
  end

end
