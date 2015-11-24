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

ActiveRecord::Schema.define(version: 20151123214434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "category_id"
    t.string   "description"
    t.decimal  "price"
    t.boolean  "available"
    t.decimal  "discount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["restaurant_id"], name: "index_items_on_restaurant_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.integer  "amount"
    t.datetime "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["item_id"], name: "index_orders_on_item_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "description"
    t.decimal  "price"
    t.integer  "max_restaurants"
    t.integer  "max_employees"
    t.integer  "max_items"
    t.string   "periodicity"
    t.decimal  "discount"
    t.boolean  "renew",           default: false
    t.datetime "date_signature"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "recommended",     default: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.integer  "user_id"
    t.integer  "plan_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "name"
    t.string   "cpf"
    t.string   "cel"
    t.boolean  "terms"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["plan_id"], name: "index_users_on_plan_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_id"], name: "index_users_on_user_id", using: :btree

  add_foreign_key "items", "categories"
  add_foreign_key "items", "restaurants"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurants", "users"
  add_foreign_key "users", "plans"
  add_foreign_key "users", "users"
end
