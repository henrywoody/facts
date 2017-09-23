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

ActiveRecord::Schema.define(version: 20170920190351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.text "info"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_item_topics", force: :cascade do |t|
    t.integer "order_num"
    t.bigint "item_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id", "topic_id"], name: "index_join_item_topics_on_item_id_and_topic_id"
    t.index ["item_id"], name: "index_join_item_topics_on_item_id"
    t.index ["topic_id", "item_id"], name: "index_join_item_topics_on_topic_id_and_item_id"
    t.index ["topic_id"], name: "index_join_item_topics_on_topic_id"
  end

  create_table "join_topic_user_pages", force: :cascade do |t|
    t.integer "order_num"
    t.bigint "topic_id"
    t.bigint "user_page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id", "user_page_id"], name: "index_join_topic_user_pages_on_topic_id_and_user_page_id"
    t.index ["topic_id"], name: "index_join_topic_user_pages_on_topic_id"
    t.index ["user_page_id", "topic_id"], name: "index_join_topic_user_pages_on_user_page_id_and_topic_id"
    t.index ["user_page_id"], name: "index_join_topic_user_pages_on_user_page_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_pages", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_pages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "join_item_topics", "items"
  add_foreign_key "join_item_topics", "topics"
  add_foreign_key "join_topic_user_pages", "topics"
  add_foreign_key "join_topic_user_pages", "user_pages"
  add_foreign_key "user_pages", "users"
end
