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

ActiveRecord::Schema.define(version: 20141114182157) do

  create_table "airbrake_exceptions", force: true do |t|
    t.text "xml_result"
  end

  create_table "errors", force: true do |t|
    t.integer "user_id"
    t.text    "error_message"
    t.integer "site_id"
    t.integer "account_id"
    t.integer "company_id"
    t.text    "site_name"
    t.text    "account_name"
    t.text    "company_name"
    t.text    "username"
    t.text    "controller"
    t.text    "category"
    t.integer "group_id"
    t.string  "action"
    t.string  "environment"
    t.text    "group_xml"
    t.integer "taskforce_id"
  end

  create_table "exceptions_tables", force: true do |t|
  end

  create_table "taskforces", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
