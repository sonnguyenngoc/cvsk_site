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

ActiveRecord::Schema.define(version: 20151218022609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "level"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listing_menu_products", force: :cascade do |t|
    t.integer  "menu_content_id"
    t.integer  "product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "mains", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "manufacturer_images", force: :cascade do |t|
    t.integer  "manufacturer_id"
    t.string   "listing_image_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "image_url"
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.text     "intro"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_contents", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.decimal  "price",      precision: 8, scale: 2
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "type_id"
    t.string   "customer_name"
    t.string   "customer_email"
    t.string   "customer_phone"
    t.integer  "many_people"
    t.text     "message"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "order_time"
    t.datetime "order_date"
  end

  create_table "parent_categories", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "title"
    t.text     "content"
    t.text     "general_benefit"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "image_url"
    t.string   "run_check"
  end

  create_table "product_of_events", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "image_url"
    t.string   "name"
    t.decimal  "price",           precision: 8, scale: 2
    t.integer  "category_id"
    t.integer  "manufacturer_id"
    t.text     "description"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "slide_shows", force: :cascade do |t|
    t.string   "image_url"
    t.string   "title_1"
    t.string   "title_2"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "tag_name"
    t.string   "link"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
