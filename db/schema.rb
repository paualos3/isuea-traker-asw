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

ActiveRecord::Schema.define(version: 20171128195659) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ar_internal_metadata", ["key"], name: "sqlite_autoindex_ar_internal_metadata_1", unique: true

  create_table "comments", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", null: false
    t.integer  "issue_id"
    t.integer  "user_id"
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["issue_id", "created_at"], name: "index_comments_on_issue_id_and_created_at"
  add_index "comments", ["issue_id"], name: "index_comments_on_issue_id"
  add_index "comments", ["user_id", "created_at"], name: "index_comments_on_user_id_and_created_at"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "issues", force: :cascade do |t|
    t.string   "issue"
    t.string   "description"
    t.string   "user"
    t.integer  "votes"
    t.string   "pinnedId"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assignee"
    t.string   "attachment"
    t.string   "priority"
    t.string   "status"
  end

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"

  create_table "watch_relationships", force: :cascade do |t|
    t.integer  "watcher_id"
    t.integer  "watched_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "watch_relationships", ["watched_id", "watcher_id"], name: "index_watch_relationships_on_watched_id_and_watcher_id", unique: true
  add_index "watch_relationships", ["watched_id"], name: "index_watch_relationships_on_watched_id"
  add_index "watch_relationships", ["watcher_id"], name: "index_watch_relationships_on_watcher_id"

end
