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

ActiveRecord::Schema.define(version: 20151005145830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.text     "content"
    t.string   "image"
    t.integer  "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carousels", force: :cascade do |t|
    t.string   "image"
    t.string   "title"
    t.string   "subtitle"
    t.string   "button"
    t.string   "button_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communications", force: :cascade do |t|
    t.text     "content"
    t.string   "comm_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.date     "date_from"
    t.date     "date_to"
    t.string   "name"
    t.string   "program"
    t.string   "hours"
    t.string   "announcement"
    t.string   "result"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string   "category"
    t.text     "question"
    t.text     "answer"
    t.integer  "views"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "horses", force: :cascade do |t|
    t.string   "name"
    t.string   "father"
    t.string   "mother"
    t.integer  "year_of_birth"
    t.string   "nation"
    t.string   "cv_url"
    t.string   "category"
    t.text     "description"
    t.string   "picture"
    t.string   "video"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "mares", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_type"
    t.string   "category"
    t.string   "name"
    t.text     "description"
    t.string   "picture"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "services", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "division"
    t.string   "role"
    t.integer  "order"
    t.string   "picture"
    t.string   "facebook"
    t.string   "mail"
    t.string   "phone"
    t.string   "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
