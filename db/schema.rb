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

ActiveRecord::Schema.define(version: 20141129152550) do

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "products", force: true do |t|
    t.string  "category_name"
    t.string  "name"
    t.decimal "price"
    t.decimal "small_price"
    t.text    "ingredients"
    t.integer "product_holder_id"
    t.string  "product_holder_type"
  end

  add_index "products", ["product_holder_id", "product_holder_type"], name: "index_products_on_product_holder_id_and_product_holder_type"

  create_table "tickets", force: true do |t|
    t.decimal  "total_price"
    t.integer  "items_count"
    t.boolean  "alcohol"
    t.datetime "to_be_served_at"
    t.string   "delivery_address"
    t.string   "created_by"
    t.string   "ordered_by"
    t.string   "status"
    t.datetime "created_at"
  end

  add_index "tickets", ["created_at", "created_by"], name: "index_tickets_on_created_at_and_created_by"

end
