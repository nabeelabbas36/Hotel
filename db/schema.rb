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

ActiveRecord::Schema.define(version: 20131004144405) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "cities", force: true do |t|
    t.integer  "country_id",            null: false
    t.integer  "region_id",             null: false
    t.string   "name",       limit: 45, null: false
    t.float    "latitude",              null: false
    t.float    "longitude",             null: false
    t.string   "timezone",   limit: 10, null: false
    t.integer  "dma_id"
    t.string   "county",     limit: 25
    t.string   "code",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["name"], name: "index_cities_on_name"

  create_table "countries", force: true do |t|
    t.string   "name",                 limit: 50, null: false
    t.string   "fips104",              limit: 2,  null: false
    t.string   "iso2",                 limit: 2,  null: false
    t.string   "iso3",                 limit: 3,  null: false
    t.string   "ison",                 limit: 4,  null: false
    t.string   "internet",             limit: 2,  null: false
    t.string   "capital",              limit: 25
    t.string   "map_reference",        limit: 50
    t.string   "nationality_singular", limit: 35
    t.string   "nationaiity_plural",   limit: 35
    t.string   "currency",             limit: 30
    t.string   "currency_code",        limit: 3
    t.integer  "population"
    t.string   "title",                limit: 50
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.integer  "city_id"
    t.string   "area"
    t.string   "address"
    t.time     "start_time"
    t.time     "close_time"
    t.boolean  "delievery"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.integer  "price"
    t.string   "outlet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "regions", force: true do |t|
    t.integer  "country_id",            null: false
    t.string   "name",       limit: 45, null: false
    t.string   "code",       limit: 8,  null: false
    t.string   "adm1code",   limit: 4,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "title"
    t.string   "review_box"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sharing_statistics", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "user_id"
    t.string   "media"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_infos", force: true do |t|
    t.integer  "restaurant_id"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "tumblr"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
