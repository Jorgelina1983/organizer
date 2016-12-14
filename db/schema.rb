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

ActiveRecord::Schema.define(version: 20160214162703) do

  create_table "lists", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "schema_id",  limit: 4
    t.string   "columns",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "logins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.string   "identification",    limit: 255
    t.string   "benefit",           limit: 255
    t.string   "cell_phone",        limit: 255
    t.string   "phone",             limit: 255
    t.date     "dob"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "address",           limit: 255
    t.string   "address_number",    limit: 255
    t.boolean  "associated",                    default: false, null: false
    t.integer  "associated_number", limit: 4,   default: 0,     null: false
  end

  create_table "person_lists", force: :cascade do |t|
    t.integer  "person_id",  limit: 4,   null: false
    t.integer  "list_id",    limit: 4,   null: false
    t.string   "payments",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "schemas", force: :cascade do |t|
    t.string   "name",         limit: 255, null: false
    t.integer  "seats",        limit: 4,   null: false
    t.string   "company",      limit: 255
    t.string   "seats_schema", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "username",   limit: 255
    t.string   "password",   limit: 255
  end

end
