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

ActiveRecord::Schema.define(version: 20150320152607) do

  create_table "airbrake_exceptions", force: :cascade do |t|
    t.text "xml_result"
  end

  create_table "applications", force: :cascade do |t|
    t.string   "name"
    t.integer  "airbrake_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "error_tags", force: :cascade do |t|
    t.integer  "error_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "error_tags", ["error_id"], name: "index_error_tags_on_error_id"
  add_index "error_tags", ["tag_id"], name: "index_error_tags_on_tag_id"

  create_table "errors", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "error_message"
    t.integer  "site_id"
    t.integer  "account_id"
    t.integer  "company_id"
    t.text     "site_name"
    t.text     "account_name"
    t.text     "company_name"
    t.text     "username"
    t.text     "controller"
    t.text     "category"
    t.string   "action"
    t.string   "environment"
    t.text     "group_xml"
    t.integer  "taskforce_id"
    t.integer  "application_id"
    t.string   "airbrake_id"
    t.string   "error_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
