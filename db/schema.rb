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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Comment", primary_key: "ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "User_ID"
    t.integer "Post_ID"
    t.string "Text", limit: 200
  end

  create_table "Friend", primary_key: "ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "User_ID"
    t.integer "Friend_ID"
    t.string "Status", limit: 10
  end

  create_table "Like", primary_key: "ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "User_ID"
    t.integer "Post_ID"
  end

  create_table "Post", primary_key: "ID", id: :integer, default: nil, force: :cascade do |t|
    t.integer "User_ID"
    t.string "Title", limit: 15
    t.string "Description", limit: 500
  end

  create_table "User", primary_key: "ID", id: :integer, default: nil, force: :cascade do |t|
    t.string "Username", limit: 10
    t.string "Email", limit: 25
    t.string "Password", limit: 25
    t.string "ImageLink", limit: 100
  end

end
