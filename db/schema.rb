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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130813200501) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "superuser",              default: false, null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicle_drivers", force: true do |t|
    t.string   "surname"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "gender"
    t.date     "birthday"
    t.string   "driver_license_registration"
    t.string   "email"
    t.string   "mobile_one"
    t.string   "mobile_two"
    t.string   "home_address"
    t.string   "state_of_origin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  add_index "vehicle_drivers", ["full_name"], name: "driversfullnameindex", unique: true, using: :btree

  create_table "vehicle_owners", force: true do |t|
    t.string   "surname"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "gender"
    t.date     "birthday"
    t.string   "email"
    t.string   "mobile_one"
    t.string   "mobile_two"
    t.string   "work_phone_one"
    t.string   "work_phone_two"
    t.string   "home_address"
    t.string   "business_address"
    t.string   "state_of_origin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  add_index "vehicle_owners", ["full_name"], name: "ownersfullnameindex", unique: true, using: :btree
  add_index "vehicle_owners", ["surname", "first_name", "middle_name", "gender"], name: "vd_fullnames_gender_index", unique: true, using: :btree
  add_index "vehicle_owners", ["surname", "first_name", "middle_name", "gender"], name: "vo_fullnames_gender_index", unique: true, using: :btree

  create_table "vehicle_routes", force: true do |t|
    t.string   "route_number"
    t.string   "first_end"
    t.string   "second_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_route_name"
    t.string   "reverse_route_name"
  end

  add_index "vehicle_routes", ["first_end", "second_end"], name: "firstendsecondend", unique: true, using: :btree
  add_index "vehicle_routes", ["full_route_name"], name: "fullroutenameindex", unique: true, using: :btree
  add_index "vehicle_routes", ["reverse_route_name"], name: "reverseroutenameindex", unique: true, using: :btree
  add_index "vehicle_routes", ["route_number"], name: "routenumber", unique: true, using: :btree

  create_table "vehicle_types", force: true do |t|
    t.string   "type_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_types", ["type_name"], name: "typename", unique: true, using: :btree

  create_table "vehicle_vehicle_drivers", force: true do |t|
    t.integer  "vehicle_id",        null: false
    t.integer  "vehicle_driver_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_vehicle_drivers", ["vehicle_id", "vehicle_driver_id"], name: "v_v_d_index", unique: true, using: :btree

  create_table "vehicle_vehicle_routes", force: true do |t|
    t.integer  "vehicle_id",       null: false
    t.integer  "vehicle_route_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_vehicle_routes", ["vehicle_id", "vehicle_route_id"], name: "v_v_r_index", unique: true, using: :btree

  create_table "vehicles", force: true do |t|
    t.string   "plate_number"
    t.string   "pin_number"
    t.integer  "vehicle_type_id",  null: false
    t.integer  "vehicle_owner_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["pin_number"], name: "pinnumber", unique: true, using: :btree
  add_index "vehicles", ["plate_number"], name: "platenumber", unique: true, using: :btree

  add_foreign_key "vehicle_vehicle_drivers", "vehicle_drivers", :name => "vehicle_vehicle_drivers_vehicle_driver_id_fk"
  add_foreign_key "vehicle_vehicle_drivers", "vehicles", :name => "vehicle_vehicle_drivers_vehicle_id_fk"

  add_foreign_key "vehicle_vehicle_routes", "vehicle_routes", :name => "vehicle_vehicle_routes_vehicle_route_id_fk"
  add_foreign_key "vehicle_vehicle_routes", "vehicles", :name => "vehicle_vehicle_routes_vehicle_id_fk"

  add_foreign_key "vehicles", "vehicle_owners", :name => "vehicles_vehicle_owner_id_fk"
  add_foreign_key "vehicles", "vehicle_types", :name => "vehicles_vehicle_type_id_fk"

end
