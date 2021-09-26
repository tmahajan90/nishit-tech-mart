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

ActiveRecord::Schema.define(version: 20210926104550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batteries", force: :cascade do |t|
    t.string   "name"
    t.string   "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_details", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "base_price"
    t.string   "gst_price"
    t.string   "subsidy_price"
    t.string   "total_price"
    t.integer  "invoice_no"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["order_id"], name: "index_bill_details_on_order_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile_no"
    t.string   "address"
    t.string   "aadhaar_no"
    t.string   "pan_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "vehicle_type_id"
    t.datetime "received_on"
    t.integer  "quantity"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "remaining_quantity"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "delivery_on"
    t.integer  "client_id"
    t.integer  "vehicle_detail_id"
    t.boolean  "delivered",         default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["client_id"], name: "index_orders_on_client_id", using: :btree
    t.index ["vehicle_detail_id"], name: "index_orders_on_vehicle_detail_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle_details", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "chassis_no"
    t.string   "engine_no"
    t.string   "controller_no"
    t.string   "motor_no"
    t.string   "charger_no_1"
    t.string   "charger_no_2"
    t.integer  "color_id"
    t.integer  "make_of_battery"
    t.integer  "battery_id"
    t.string   "manual_no"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.string   "watts"
    t.string   "battery_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "bill_details", "orders"
  add_foreign_key "orders", "clients"
  add_foreign_key "orders", "vehicle_details"
end
