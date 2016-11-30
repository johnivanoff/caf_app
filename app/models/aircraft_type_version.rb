class AircraftTypeVersion < PaperTrail::Version
  attr_accessible :author_username
  
  self.table_name = :aircraft_type_versions

# Don't need to track creates
  default_scope { where('event != "create"') }

end