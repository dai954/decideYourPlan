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

ActiveRecord::Schema.define(version: 2020_08_23_090318) do

  create_table "places", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image"
    t.string "prefecture"
    t.text "description"
  end

  create_table "searches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "lunch_name"
    t.text "lunch_text"
    t.text "lunch_image"
    t.string "lunch_address"
    t.string "lunch_link"
    t.string "dinner_name"
    t.text "dinner_text"
    t.text "dinner_image"
    t.string "dinner_address"
    t.string "dinner_link"
    t.integer "section1"
    t.integer "section2"
    t.integer "section3"
    t.integer "section4"
    t.bigint "place_id"
    t.bigint "subplace_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_searches_on_place_id"
    t.index ["subplace_id"], name: "index_searches_on_subplace_id"
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "subplaces", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "place_id"
    t.string "address"
    t.string "link"
    t.text "image"
    t.string "prefecture"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "searches", "places"
  add_foreign_key "searches", "subplaces"
  add_foreign_key "searches", "users"
end
