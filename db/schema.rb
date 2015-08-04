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

ActiveRecord::Schema.define(version: 20150804223422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "deities", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name"
    t.string   "name_hiragana"
    t.string   "name_katakana"
    t.text     "detail"
    t.text     "tags"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "deities_shrines", id: false, force: :cascade do |t|
    t.integer "deity_id",  null: false
    t.integer "shrine_id", null: false
  end

  add_index "deities_shrines", ["deity_id", "shrine_id"], name: "index_deities_shrines_on_deity_id_and_shrine_id", using: :btree
  add_index "deities_shrines", ["shrine_id", "deity_id"], name: "index_deities_shrines_on_shrine_id_and_deity_id", using: :btree

  create_table "shrines", id: :uuid, default: "gen_random_uuid()", force: :cascade do |t|
    t.string   "name"
    t.string   "name_hiragana"
    t.string   "name_katakana"
    t.text     "detail"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "address"
    t.string   "hp"
    t.text     "tags"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
