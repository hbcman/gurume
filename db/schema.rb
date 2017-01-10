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

ActiveRecord::Schema.define(version: 20161229024756) do

  create_table "logins", force: :cascade do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,           null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username",               default: "anonymous"
    t.boolean  "admin_flg"
  end

  add_index "logins", ["confirmation_token"], name: "index_logins_on_confirmation_token", unique: true
  add_index "logins", ["email"], name: "index_logins_on_email", unique: true
  add_index "logins", ["reset_password_token"], name: "index_logins_on_reset_password_token", unique: true
  add_index "logins", ["unlock_token"], name: "index_logins_on_unlock_token", unique: true

  create_table "shintyakus", force: :cascade do |t|
    t.string   "shopname"
    t.string   "title"
    t.date     "date"
    t.text     "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tokusyus", force: :cascade do |t|
    t.string   "title"
    t.date     "date"
    t.text     "comment"
    t.text     "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.string   "address"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "tel"
    t.string   "closingday"
    t.string   "time"
    t.string   "airphoto"
    t.text     "airtext"
    t.string   "menuphoto"
    t.text     "menutext"
    t.string   "itioshiphoto"
    t.text     "itioshitext"
    t.text     "coupon"
    t.string   "money"
    t.string   "storeurl"
    t.text     "comment"
    t.text     "feature"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
