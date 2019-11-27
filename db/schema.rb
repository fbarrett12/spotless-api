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

ActiveRecord::Schema.define(version: 2019_11_26_230654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "couriers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "loads", force: :cascade do |t|
    t.boolean "washed"
    t.boolean "done"
    t.bigint "user_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_loads_on_provider_id"
    t.index ["user_id"], name: "index_loads_on_user_id"
  end

  create_table "pick_ups", force: :cascade do |t|
    t.bigint "load_id", null: false
    t.bigint "courier_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["courier_id"], name: "index_pick_ups_on_courier_id"
    t.index ["load_id"], name: "index_pick_ups_on_load_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "title"
    t.string "body"
    t.integer "rating"
    t.bigint "user_id", null: false
    t.bigint "provider_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["provider_id"], name: "index_reviews_on_provider_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "type"
    t.string "password_digest"
  end

  add_foreign_key "loads", "providers"
  add_foreign_key "loads", "users"
  add_foreign_key "pick_ups", "couriers"
  add_foreign_key "pick_ups", "loads"
  add_foreign_key "reviews", "providers"
  add_foreign_key "reviews", "users"
end
