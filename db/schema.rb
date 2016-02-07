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

ActiveRecord::Schema.define(version: 20150714040451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_orders", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "order_id"
    t.integer "item_quantity"
  end

  add_index "item_orders", ["item_id"], name: "index_item_orders_on_item_id", using: :btree
  add_index "item_orders", ["order_id"], name: "index_item_orders_on_order_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string  "description"
    t.decimal "price",       precision: 8, scale: 2
    t.integer "merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "purchaser_id"
  end

  create_table "purchasers", force: :cascade do |t|
    t.string "name"
  end

end
