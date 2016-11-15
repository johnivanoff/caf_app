class UserVersion < PaperTrail::Version
  attr_accessible :author_username
  
  self.table_name = :user_versions

# Don't need to track creates
  default_scope { where('event != "create"') }

end