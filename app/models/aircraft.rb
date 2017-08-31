class Aircraft < ActiveRecord::Base
  belongs_to :aircraft_type
  belongs_to :unit

#  has_many :aicraft_classes, :through => :aircraft_type

  attr_accessible :aircraft_type_id, :description, :n_number, :name, :nose_art, :profile_photo, :website, :tours, :rides, :unit_id

  has_paper_trail :class_name => 'AircraftVersion',
     :meta => { :author_username => :user_name}

  mount_uploader :profile_photo, AircraftProfileUploader

  scope :bomber, joins(:aircraft_classes).merge(AircraftClass.bomber)
#  scope :type_order, joins(:aircraft_type).merge(AircraftType.type_order)
  
#  scope :dues_current, joins(:dues_payments).merge(DuesPayment.current)
end
