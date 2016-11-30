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

ActiveRecord::Schema.define(:version => 20161130213918) do

  create_table "aircraft_classes", :force => true do |t|
    t.string   "class_type"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "aircraft_type_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
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
    t.string   "author_username"
    t.datetime "created_at"
  end

  add_index "aircraft_versions", ["item_type", "item_id"], :name => "index_aircraft_versions_on_item_type_and_item_id"

  create_table "aircrafts", :force => true do |t|
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

  add_index "aircrafts", ["aircraft_type_id"], :name => "index_aircrafts_on_aircraft_type_id_id"

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "grants", :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "grants", ["right_id"], :name => "index_grants_on_right_id"
  add_index "grants", ["role_id"], :name => "index_grants_on_role_id"

  create_table "member_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
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
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "menus", :force => true do |t|
    t.integer  "parent_id"
    t.string   "display"
    t.string   "url"
    t.integer  "position"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  create_table "units", :force => true do |t|
    t.string   "unit_name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "primary_phone"
    t.string   "primary_email"
    t.string   "website"
    t.text     "description"
    t.boolean  "museum",        :default => false, :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "user_versions", :force => true do |t|
    t.string   "item_type",       :null => false
    t.integer  "item_id",         :null => false
    t.string   "event",           :null => false
    t.string   "whodunnit"
    t.text     "object"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

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
