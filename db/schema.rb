# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_09_153434) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "swipes", force: :cascade do |t|
    t.bigint "swiped_by_id", null: false
    t.bigint "swiped_user_id", null: false
    t.string "status"
    t.boolean "is_match"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["swiped_by_id"], name: "index_swipes_on_swiped_by_id"
    t.index ["swiped_user_id"], name: "index_swipes_on_swiped_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthdate"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "school"
    t.text "bio"
    t.json "images", default: {"images"=>[]}
    t.boolean "isadmin", default: false
    t.boolean "gender"
    t.boolean "gender_interest"
  end

  add_foreign_key "swipes", "users", column: "swiped_by_id"
  add_foreign_key "swipes", "users", column: "swiped_user_id"
end
