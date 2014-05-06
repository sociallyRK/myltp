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

ActiveRecord::Schema.define(version: 20140506175217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "financialinstruments", force: true do |t|
    t.string   "instrument_type"
    t.string   "instrument_sub"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "financialinstruments", ["user_id"], name: "index_financialinstruments_on_user_id", using: :btree

  create_table "realestates", force: true do |t|
    t.string   "zipaddress"
    t.string   "zipcity"
    t.integer  "zipcode"
    t.integer  "zipid"
    t.integer  "zestimate"
    t.string   "zillow_link"
    t.integer  "financialinstrument_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zipstate"
  end

  add_index "realestates", ["financialinstrument_id"], name: "index_realestates_on_financialinstrument_id", using: :btree
  add_index "realestates", ["user_id"], name: "index_realestates_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.integer  "personal_income"
    t.string   "spouse_name"
    t.date     "spouse_birthday"
    t.integer  "spouse_income"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.float    "Realestatesum",   default: 0.0
  end

end
