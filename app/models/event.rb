class Event < ActiveRecord::Base
  attr_accessible :contact_info, :details, :event_URL, :event_end, :event_start, :event_statuses_id, :event_title, :graphic_address, :feature_image, :location_id, :unit_id

  belongs_to :unit
  belongs_to :location
  accepts_nested_attributes_for :location, :allow_destroy => true

  has_paper_trail :class_name => 'EventVersion',
     :meta => { :author_username => :user_name}

  mount_uploader :feature_image, ImageUploader

  validates :location_id, :event_title, :event_start, :event_end, :presence => true, :on => :create

scope :published, lambda {
  where ("events.event_start IS NOT NULL AND events.event_end > ?"), (Time.zone.now - 2.day)
  }

  scope :ordered, order("events.event_start ASC")
  scope :reverse, order("events.event_start DESC")
  
end
