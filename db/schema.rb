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

ActiveRecord::Schema.define(version: 20150102142957) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "phone_number_1", null: false
    t.integer  "phone_number_2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["first_name", "last_name"], name: "index_customers_on_first_name_and_last_name"

  create_table "delivery_addresses", force: true do |t|
    t.string   "city",                                     null: false
    t.string   "street"
    t.string   "flat_number"
    t.integer  "house_number",                             null: false
    t.integer  "distance_by_car"
    t.integer  "distance"
    t.decimal  "longitude",       precision: 10, scale: 7
    t.decimal  "latitude",        precision: 10, scale: 7
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delivery_addresses", ["city", "street"], name: "index_delivery_addresses_on_city_and_street"

  create_table "products", force: true do |t|
    t.string  "name"
    t.decimal "price"
    t.text    "ingredients"
    t.integer "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["name"], name: "index_products_on_name", unique: true

  create_table "ticket_items", force: true do |t|
    t.integer  "product_id"
    t.integer  "ticket_id"
    t.integer  "amount",       default: 0
    t.decimal  "price",        default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_name"
  end

  create_table "tickets", force: true do |t|
    t.decimal  "total_price",                  default: 0.0
    t.integer  "items_count",                  default: 0
    t.boolean  "alcohol",                      default: true
    t.datetime "to_be_served_at"
    t.string   "delivery_address"
    t.string   "ordered_by"
    t.string   "status",                       default: "open"
    t.datetime "created_at"
    t.boolean  "delivery",         limit: 255, default: false
    t.datetime "closed_at"
    t.datetime "underwayed_at"
    t.integer  "todays_nr"
    t.integer  "user_id"
  end

  add_index "tickets", ["created_at", "user_id"], name: "index_tickets_on_created_at_and_user_id", unique: true
  add_index "tickets", ["created_at"], name: "index_tickets_on_created_at", unique: true
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
