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

ActiveRecord::Schema.define(version: 20160310220854) do

  create_table "battles", force: :cascade do |t|
    t.boolean "accepted"
    t.boolean "started",  default: false
    t.boolean "finished", default: false
    t.boolean "won"
  end

  create_table "breeds", force: :cascade do |t|
    t.string  "name"
    t.string  "image_url"
    t.integer "max_health"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "defense"
  end

  create_table "contenders", force: :cascade do |t|
    t.integer "battle_id"
    t.integer "user_id"
    t.boolean "challenger", default: false
  end

  create_table "effect_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "item_effects", force: :cascade do |t|
    t.float   "modifier1"
    t.float   "modifier2"
    t.float   "modifier3"
    t.time    "time_modifier"
    t.string  "text_modifier"
    t.integer "item_id"
    t.integer "effect_type_id"
  end

  create_table "item_type_effects", force: :cascade do |t|
    t.integer "item_type_id"
    t.integer "effect_type_id"
    t.float   "modifier1"
    t.float   "modifier2"
    t.float   "modifier3"
    t.time    "time_modifier"
    t.string  "text_modifier"
  end

  create_table "item_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "durability"
    t.string   "image_url"
    t.datetime "expires"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "durability"
    t.datetime "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_type_id"
  end

  create_table "pet_ownerships", force: :cascade do |t|
  end

  create_table "pets", force: :cascade do |t|
    t.string  "name"
    t.integer "max_health"
    t.integer "health"
    t.integer "hunger"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "defense"
  end

  create_table "player_inventories", force: :cascade do |t|
    t.integer  "pid"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shop_inventories", force: :cascade do |t|
    t.integer  "sid"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shop_name"
    t.integer  "shopkeeper_id"
    t.string   "location"
    t.integer  "inventory_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dollaz",          default: 0,                                      null: false
    t.string   "guid",            default: "00000000-0000-0000-0000-000000000000", null: false
    t.integer  "inventory_id"
  end

end
