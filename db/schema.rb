# frozen_string_literal: true

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
  enable_extension 'plpgsql'

  create_table 'comments', primary_key: 'id', id: :integer, default: nil, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
    t.string 'text', limit: 200
  end

  create_table 'friends', primary_key: 'id', id: :integer, default: nil, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'friend_id'
    t.string 'status', limit: 10
  end

  create_table 'likes', primary_key: 'id', id: :integer, default: nil, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'post_id'
  end

  create_table 'posts', primary_key: 'id', id: :integer, default: nil, force: :cascade do |t|
    t.integer 'user_id'
    t.string 'title', limit: 15
    t.string 'description', limit: 500
  end

  create_table 'users', primary_key: 'id', id: :integer, default: nil, force: :cascade do |t|
    t.string 'name', limit: 10
    t.string 'email', limit: 25
    t.string 'password', limit: 25
    t.string 'image_link', limit: 100
  end
end
