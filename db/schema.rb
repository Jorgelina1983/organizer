# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_23_124816) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "schema_id"
    t.string "columns"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", id: :serial, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "identification"
    t.string "benefit"
    t.string "cell_phone"
    t.string "phone"
    t.date "dob"
    t.string "address"
    t.string "address_number"
    t.boolean "traveler", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "associated_number", default: 0, null: false
    t.boolean "patient", default: false
  end

  create_table "person_lists", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_id"
    t.integer "list_id"
    t.integer "position"
    t.index ["list_id"], name: "index_person_lists_on_list_id"
    t.index ["person_id"], name: "index_person_lists_on_person_id"
  end

  create_table "schemas", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.integer "seats", null: false
    t.string "company"
    t.string "seats_schema"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
