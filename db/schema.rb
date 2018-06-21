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

ActiveRecord::Schema.define(version: 2018_06_21_133832) do

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street_address"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "pet_type"
    t.string "breed"
    t.integer "age"
    t.string "temperament"
    t.text "bio"
    t.boolean "single_pet"
    t.boolean "family_friendly"
    t.integer "shelter_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.string "avatars"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "shelters", force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.string "telephone_number"
    t.string "email_address"
    t.text "description"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "dwelling_type"
    t.integer "household_members"
    t.boolean "kids"
    t.string "password_digest"
    t.integer "location_id"
    t.string "email_address"
    t.text "bio"
    t.boolean "shelter_employee", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employer_id"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
