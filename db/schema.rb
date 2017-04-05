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

ActiveRecord::Schema.define(version: 20170405021054) do

  create_table "moments", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "moments", ["user_id"], name: "index_moments_on_user_id"

  create_table "official_accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_follow_official_accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "official_account_id"
  end

  add_index "user_follow_official_accounts", ["official_account_id"], name: "index_user_follow_official_accounts_on_official_account_id"
  add_index "user_follow_official_accounts", ["user_id"], name: "index_user_follow_official_accounts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "gender"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "location"
    t.string   "password"
    t.string   "province"
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal  "money"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
