class Event < ActiveRecord::Base
  attr_accessible :contact_info, :details, :event_URL, :event_end, :event_start, :event_statuses_id, :event_title, :graphic_address, :location_id, :unit_id

  belongs_to :unit
  belongs_to :location

  has_paper_trail :class_name => 'EventVersion',
     :meta => { :author_username => :user_name}
  
end
