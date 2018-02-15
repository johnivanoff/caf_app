class Right < ActiveRecord::Base
  attr_accessible :operation, :resource

  has_many :grants
  has_many :roles, :through => :grants
  OPERATION_MAPPINGS = {
    "new" => "CREATE",
    "create" => "CREATE",
    "edit" => "UPDATE",
    "update" => "UPDATE",
    "destroy" => "DELETE",
    "show" => "READ",
    "index" => "READ",
    "sort" => "UPDATE",
    "unit_admin" => "READ",
    "aircraft_admin" => "READ",
    "hq_directory" => "READ",
    "hq_position_admin" => "READ",
    "headquarters_staff" => "READ",
    "general_staff" => "READ",
    "home" => "READ",
    "member_home" => "READ",
    "news_index" => "READ",
    "new_page" => "READ",
    "add_news" => "READ",
    "blogs_index" => "READ",
    "add_blog" => "READ"
	}

	scope :ordered, order("rights.resource ASC")

	scope :id_ordered, order("rights.id ASC")

	scope :ordered_ops, :order => "field(operation,'CREATE','READ','UPDATE','DELETE')"

	scope :unique_resources, :select => 'DISTINCT resource'

  def oper_resource
    "#{resource} #{operation}"
  end

end
