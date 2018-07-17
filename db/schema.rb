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

ActiveRecord::Schema.define(version: 20180717044120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.index ["dependent_id"], name: "index_groups_on_dependent_id"
    t.index ["leader_id"], name: "index_groups_on_leader_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "gender"
    t.string "classification"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "admin", default: false
  end

  create_table "sectors", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "groups", "members", column: "dependent_id"
  add_foreign_key "groups", "members", column: "leader_id"
end
