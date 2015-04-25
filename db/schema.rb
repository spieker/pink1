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

ActiveRecord::Schema.define(version: 20150425131416) do

  create_table "aliases", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "source",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "aliases", ["source"], name: "index_aliases_on_source", unique: true, using: :btree
  add_index "aliases", ["user_id"], name: "index_aliases_on_user_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "domains", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "domains", ["company_id"], name: "index_domains_on_company_id", using: :btree
  add_index "domains", ["name"], name: "index_domains_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "company_id", limit: 4
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "aliases", "users"
  add_foreign_key "domains", "companies"
  add_foreign_key "users", "companies"
end
