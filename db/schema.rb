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

ActiveRecord::Schema.define(version: 20161026084358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.integer  "post_id"
    t.integer  "author_id"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author_id", "post_id"], name: "index_comments_on_author_id_and_post_id", using: :btree
    t.index ["author_id"], name: "index_comments_on_author_id", using: :btree
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.integer  "author_id"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["author_id"], name: "index_posts_on_author_id", using: :btree
    t.index ["title"], name: "index_posts_on_title", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "auth_token"
    t.integer  "posts_count"
    t.integer  "comments_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["nickname"], name: "index_users_on_nickname", using: :btree
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "posts", "users", column: "author_id"
end
