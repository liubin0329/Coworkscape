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

ActiveRecord::Schema.define(:version => 20120523055622) do

  create_table "plans", :force => true do |t|
    t.string   "title"
    t.decimal  "price"
    t.string   "per"
    t.integer  "space_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spaces", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "website"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "zip"
    t.string   "pref"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "phone"
    t.string   "email"
    t.string   "organization"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "twentyfour"
    t.boolean  "drinks"
    t.boolean  "conference"
    t.boolean  "pet"
    t.boolean  "phone_machine"
    t.boolean  "fax"
    t.boolean  "printer"
    t.boolean  "wifi"
    t.boolean  "reg"
    t.boolean  "weekends"
    t.boolean  "post"
    t.boolean  "receipt"
    t.boolean  "scanner"
    t.boolean  "shredder"
    t.boolean  "locker"
    t.boolean  "projector"
    t.boolean  "whiteboard"
    t.boolean  "copy"
    t.boolean  "charger"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "availability"
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.string   "photo3_content_type"
    t.integer  "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.boolean  "oneday"
    t.boolean  "visa"
    t.string   "price_notice"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "profile"
    t.string   "website"
    t.string   "name"
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
