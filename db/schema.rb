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

ActiveRecord::Schema.define(version: 20150517025304) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "teams"
    t.text     "best"
    t.text     "outstanding"
    t.text     "honorable"
    t.string   "date"
    t.text     "geo"
    t.integer  "weight"
    t.text     "about"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.integer  "students"
    t.integer  "best"
    t.integer  "outstanding"
    t.integer  "honorable"
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.string   "geo"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
