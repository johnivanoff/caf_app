# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20180714020513) do

  create_table "aircraft", :force => true do |t|
    t.string   "name"
    t.string   "n_number"
    t.text     "description"
    t.string   "website"
    t.boolean  "tours",            :default => false, :null => false
    t.boolean  "rides",            :default => false, :null => false
    t.string   "profile_photo"
    t.string   "nose_art"
    t.integer  "aircraft_type_id"
    t.integer  "unit_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "aircraft", ["aircraft_type_id"], :name => "index_aircrafts_on_aircraft_type_id_id"

  create_table "aircraft_classes", :force => true do |t|
    t.string   "class_type"
    t.text     "description"
    t.string   "type_picture", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "aircraft_classes_aircraft_types", :id => false, :force => true do |t|
    t.integer "aircraft_class_id"
    t.integer "aircraft_type_id"
  end

  create_table "aircraft_type_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "aircraft_type_versions", ["item_type", "item_id"], :name => "index_aircraft_type_versions_on_item_type_and_item_id"

  create_table "aircraft_types", :force => true do |t|
    t.integer  "aircraft_class_id"
    t.string   "aircraft_type_designation"
    t.string   "aircraft_name"
    t.text     "description"
    t.string   "manufacturer"
    t.string   "introduced"
    t.string   "production_years"
    t.string   "role"
    t.string   "power"
    t.string   "length"
    t.string   "height"
    t.string   "wingspan"
    t.string   "empty_weight"
    t.string   "gross_weight"
    t.string   "max_weight"
    t.string   "range"
    t.string   "max_speed"
    t.string   "cruise_speed"
    t.string   "ceiling"
    t.string   "crew"
    t.string   "guns"
    t.string   "hardpoints"
    t.string   "rockets"
    t.string   "bombs"
    t.string   "fuel_capacity"
    t.string   "fuel_burn"
    t.string   "oil_capacity"
    t.string   "qty_produced"
    t.string   "cost"
    t.string   "qty_still_flying"
    t.string   "silhouette"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "aircraft_types", ["aircraft_class_id"], :name => "index_aircraft_types_on_aircraft_class_id"

  create_table "aircraft_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "aircraft_versions", ["item_type", "item_id"], :name => "index_aircraft_versions_on_item_type_and_item_id"

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "caf_documents", :force => true do |t|
    t.string   "title"
    t.text     "toc"
    t.text     "description"
    t.text     "body"
    t.string   "file_url"
    t.string   "pdf"
    t.string   "image_url"
    t.date     "published_date"
    t.boolean  "current"
    t.integer  "document_category_id"
    t.integer  "position",             :default => 0, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "caf_documents", ["document_category_id"], :name => "index_caf_documents_on_document_category_id"

  create_table "content_categories", :force => true do |t|
    t.string   "category_name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "content_galleries", :force => true do |t|
    t.string   "image"
    t.text     "caption"
    t.string   "photographer"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "content_types", :force => true do |t|
    t.string   "type_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "content_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "content_versions", ["item_type", "item_id"], :name => "index_content_versions_on_item_type_and_item_id"

  create_table "contents", :force => true do |t|
    t.integer  "content_type_id"
    t.integer  "content_category_id", :null => false
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.string   "feature_image"
    t.integer  "user_id"
    t.datetime "published_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "contents", ["user_id", "title", "slug"], :name => "index_contents_on_user_id_and_title_and_slug"

  create_table "document_categories", :force => true do |t|
    t.string   "category_name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "event_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "event_versions", ["item_type", "item_id"], :name => "index_event_versions_on_item_type_and_item_id"

  create_table "events", :force => true do |t|
    t.datetime "event_start"
    t.datetime "event_end"
    t.string   "event_title"
    t.string   "event_statuses_id"
    t.integer  "location_id"
    t.string   "event_URL"
    t.string   "contact_info"
    t.text     "details"
    t.string   "graphic_address"
    t.string   "feature_image"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "unit_id"
  end

  create_table "grants", :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "grants", ["right_id"], :name => "index_grants_on_right_id"
  add_index "grants", ["role_id"], :name => "index_grants_on_role_id"

  create_table "hq_position_assignments", :force => true do |t|
    t.integer  "member_id"
    t.integer  "hq_position_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "hq_position_assignments", ["hq_position_id"], :name => "index_hq_position_assignments_on_hq_position_id"
  add_index "hq_position_assignments", ["member_id"], :name => "index_hq_position_assignments_on_member_id"

  create_table "hq_positions", :force => true do |t|
    t.string   "position_name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "location_name_short"
    t.string   "location_name"
    t.string   "airport_name"
    t.string   "icao_identifier"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "member_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "member_versions", ["item_type", "item_id"], :name => "index_member_versions_on_item_type_and_item_id"

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.string   "email"
    t.integer  "caf_col_no"
    t.date     "caf_join_date"
    t.string   "photo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "menu_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "menu_versions", ["item_type", "item_id"], :name => "index_menu_versions_on_item_type_and_item_id"

  create_table "menus", :force => true do |t|
    t.integer  "parent_id"
    t.string   "display"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "position_assignments", :force => true do |t|
    t.integer  "hq_position_id"
    t.integer  "member_id"
    t.date     "assignment_start"
    t.date     "assignment_end"
    t.text     "notes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "position_assignments", ["hq_position_id"], :name => "index_position_assignments_on_position_id"
  add_index "position_assignments", ["member_id"], :name => "index_position_assignments_on_member_id"

  create_table "positions", :force => true do |t|
    t.string   "position_name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "rights", :force => true do |t|
    t.string   "resource"
    t.string   "operation"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "social_brands", :force => true do |t|
    t.string   "social_brand_name"
    t.string   "brand_icon"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "social_links", :force => true do |t|
    t.integer  "unit_id"
    t.integer  "social_brand_id"
    t.string   "brand_url"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "social_links", ["unit_id"], :name => "index_social_links_on_unit_id"

  create_table "terms", :force => true do |t|
    t.integer  "position_id"
    t.integer  "member_id"
    t.date     "term_start"
    t.date     "term_end"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "terms", ["member_id"], :name => "index_terms_on_member_id"
  add_index "terms", ["position_id"], :name => "index_terms_on_position_id"

  create_table "unit_assignments", :force => true do |t|
    t.integer  "member_id"
    t.integer  "unit_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "unit_assignments", ["member_id"], :name => "index_unit_assignments_on_member_id"
  add_index "unit_assignments", ["unit_id"], :name => "index_unit_assignments_on_unit_id"

  create_table "unit_types", :force => true do |t|
    t.string   "type_name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "unit_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "unit_versions", ["item_type", "item_id"], :name => "index_unit_versions_on_item_type_and_item_id"

  create_table "units", :force => true do |t|
    t.string   "unit_name"
    t.integer  "unit_type_id"
    t.string   "airport_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "longitude"
    t.string   "latitude"
    t.string   "primary_phone"
    t.string   "primary_email"
    t.string   "website"
    t.text     "description"
    t.boolean  "museum",        :default => false, :null => false
    t.string   "unit_logo"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "donate_url"
    t.string   "join_url"
    t.string   "rides_url"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "user_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.text     "object_changes"
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "user_versions", ["item_type", "item_id"], :name => "index_user_versions_on_item_type_and_item_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",                        :null => false
    t.integer  "item_id",                          :null => false
    t.string   "event",                            :null => false
    t.string   "whodunnit"
    t.text     "object",     :limit => 2147483647
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
