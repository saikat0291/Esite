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

ActiveRecord::Schema.define(version: 20161012071416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_products", force: :cascade do |t|
    t.integer  "cat_id",         null: false
    t.integer  "subcat_id",      null: false
    t.string   "product_name"
    t.integer  "price"
    t.string   "product_image"
    t.string   "product_desc"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "offerId"
    t.integer  "isnew"
    t.integer  "avl_count"
    t.integer  "product_typeId"
    t.integer  "page"
  end

  create_table "e_category_msts", force: :cascade do |t|
    t.integer  "category_id",   null: false
    t.string   "category_desc"
    t.integer  "is_active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "e_offer_mstrs", force: :cascade do |t|
    t.integer  "offer"
    t.date     "upto"
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "e_producttemp_dtls", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "price",      null: false
    t.integer  "quantity",   null: false
    t.string   "user_name",  null: false
    t.string   "cart_id",    null: false
    t.integer  "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "userId",     null: false
  end

  create_table "e_subcategory_mstrs", force: :cascade do |t|
    t.integer  "cat_id",           null: false
    t.string   "subcategory_desc"
    t.integer  "is_active"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
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
