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

ActiveRecord::Schema.define(version: 20160422003909) do

  create_table "battle_turns", force: :cascade do |t|
    t.integer  "battle_id"
    t.integer  "contender_id"
    t.integer  "offensive_item_id"
    t.integer  "defensive_item_id"
    t.boolean  "completed",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.float   "hunger_rate"
  end

  create_table "contenders", force: :cascade do |t|
    t.integer "battle_id"
    t.integer "user_id"
    t.boolean "challenger", default: false
    t.integer "pet_id"
  end

  create_table "effect_types", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "to_user"
    t.integer  "from_user"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "user_1"
    t.integer  "user_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "owner_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "inventories", ["owner_type_id"], name: "index_inventories_on_owner_type_id"

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
    t.integer  "inventory_id"
  end

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.integer "unsubscriber_id"
    t.string  "unsubscriber_type"
    t.integer "conversation_id"
  end

  add_index "mailboxer_conversation_opt_outs", ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
  add_index "mailboxer_conversation_opt_outs", ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
  end

  add_index "mailboxer_notifications", ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
  add_index "mailboxer_notifications", ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
  add_index "mailboxer_notifications", ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
  add_index "mailboxer_notifications", ["type"], name: "index_mailboxer_notifications_on_type"

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "mailboxer_receipts", ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
  add_index "mailboxer_receipts", ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"

  create_table "owner_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.integer  "breed_id"
    t.string   "name"
    t.integer  "max_health"
    t.integer  "health"
    t.integer  "hunger_base"
    t.integer  "strength"
    t.integer  "dexterity"
    t.integer  "defense"
    t.datetime "last_fed"
    t.integer  "owner_id"
    t.float    "hunger_rate"
  end

  create_table "shopkeepers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "name"
    t.integer  "shopkeeper_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "shops", ["shopkeeper_id"], name: "index_shops_on_shopkeeper_id"

  create_table "trade_requests", force: :cascade do |t|
    t.integer  "to_user"
    t.integer  "from_user"
    t.integer  "item_to_user"
    t.integer  "item_from_user"
    t.boolean  "to_user_agrees",   default: false
    t.boolean  "from_user_agrees", default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dollaz",          default: 0,                                      null: false
    t.string   "guid",            default: "00000000-0000-0000-0000-000000000000", null: false
  end

end
