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

ActiveRecord::Schema.define(version: 20181129030921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendances", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_attendances_on_group_id"
    t.index ["member_id"], name: "index_attendances_on_member_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "country_id"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "day", null: false
    t.string "hour", null: false
    t.integer "classes", default: 0, null: false
    t.boolean "active", default: true
    t.string "context", default: "local"
    t.string "place"
    t.string "phone", null: false
    t.text "comments"
    t.bigint "leader_id"
    t.bigint "dependent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "sector_id"
    t.index ["dependent_id"], name: "index_groups_on_dependent_id"
    t.index ["leader_id"], name: "index_groups_on_leader_id"
    t.index ["sector_id"], name: "index_groups_on_sector_id"
  end

  create_table "groups_members", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "member_id", null: false
    t.index ["group_id", "member_id"], name: "index_groups_members_on_group_id_and_member_id"
    t.index ["member_id", "group_id"], name: "index_groups_members_on_member_id_and_group_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "gender"
    t.string "classification"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "remember_created_at"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.integer "sign_in_count", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "attendance", default: false
    t.index ["confirmation_token"], name: "index_members_on_confirmation_token", unique: true
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_members_on_unlock_token", unique: true
  end

  create_table "reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "city_id"
    t.index ["city_id"], name: "index_sectors_on_city_id"
  end

  add_foreign_key "attendances", "groups"
  add_foreign_key "attendances", "members"
  add_foreign_key "cities", "countries"
  add_foreign_key "groups", "members", column: "dependent_id"
  add_foreign_key "groups", "members", column: "leader_id"
  add_foreign_key "groups", "sectors"
  add_foreign_key "sectors", "cities"
end
