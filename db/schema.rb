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

ActiveRecord::Schema.define(version: 20140314234502) do

  create_table "brains", force: true do |t|
    t.integer  "user_id"
    t.integer  "points",         default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "action_count",   default: 0
    t.integer  "sendlove_count", default: 0
  end

  add_index "brains", ["user_id"], name: "index_brains_on_user_id", using: :btree

  create_table "dreams", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "minutes"
    t.integer  "category"
    t.integer  "minutes_per_week"
    t.integer  "minutes_this_week"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dreams", ["category"], name: "index_dreams_on_category", using: :btree
  add_index "dreams", ["user_id"], name: "index_dreams_on_user_id", using: :btree

  create_table "exercises", force: true do |t|
    t.integer  "user_id"
    t.integer  "minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id", using: :btree

  create_table "gratitudes", force: true do |t|
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gratitudes", ["user_id"], name: "index_gratitudes_on_user_id", using: :btree

  create_table "sendloves", force: true do |t|
    t.integer  "user_id"
    t.integer  "receiver_id"
    t.text     "body"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",        limit: 50
  end

  add_index "sendloves", ["email"], name: "index_sendloves_on_email", using: :btree
  add_index "sendloves", ["receiver_id"], name: "index_sendloves_on_receiver_id", using: :btree
  add_index "sendloves", ["user_id"], name: "index_sendloves_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",                   limit: 64
    t.string   "first_name",             limit: 32
    t.string   "last_name",              limit: 32
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_id",            limit: 12
    t.boolean  "has_stub_password",                 default: false
    t.string   "auth_token"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
