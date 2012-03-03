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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 26) do

  create_table "albums", :force => true do |t|
    t.string   "name",       :limit => 50
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "share_type",               :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discussions", :force => true do |t|
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "follower_followings", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "following_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "get_email_updates"
  end

  create_table "group_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name",       :limit => 50
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer  "likable_id"
    t.string   "likable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.text     "message"
    t.boolean  "deleted_by_sender"
    t.boolean  "deleted_by_receiver"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_comments", :force => true do |t|
    t.text     "comment"
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "discussable_id"
    t.string   "discussable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "photo_detail"
    t.text     "site_name"
    t.integer  "share_type"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.text     "photo_meta"
  end

  create_table "profile_pictures", :force => true do |t|
    t.integer  "user_id"
    t.string   "photo_file_name"
    t.integer  "photo_file_size"
    t.string   "photo_content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", :force => true do |t|
    t.integer "score"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rate_id"
    t.integer  "rateable_id"
    t.string   "rateable_type", :limit => 32
    t.text     "free_text"
    t.string   "rater_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["rate_id"], :name => "index_ratings_on_rate_id"
  add_index "ratings", ["rateable_id", "rateable_type"], :name => "index_ratings_on_rateable_id_and_rateable_type"

  create_table "shared_tabs", :force => true do |t|
    t.integer  "shareable_id"
    t.integer  "group_id"
    t.string   "shareable_type", :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tab_sites", :force => true do |t|
    t.integer  "tab_id"
    t.string   "site_url",   :limit => 1024
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "tabs", :force => true do |t|
    t.integer  "user_id"
    t.string   "name",       :limit => 20
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "share_type"
  end

  create_table "user_details", :force => true do |t|
    t.text     "work_info"
    t.text     "education"
    t.integer  "age"
    t.string   "sex",               :limit => 10
    t.text     "interest_internet"
    t.text     "about_me"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_discussions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "discussion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",           :limit => 50
    t.string   "account_status",     :limit => 20
    t.integer  "system_role"
    t.string   "encrypted_password"
    t.string   "confirmation_token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
