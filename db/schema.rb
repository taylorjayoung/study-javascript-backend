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

ActiveRecord::Schema.define(version: 2019_03_07_205324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "private", default: false, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "message"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["question_id"], name: "index_comments_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "questionText"
    t.string "answerText"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "private", default: false, null: false
  end

  create_table "questions_categories", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_categories_on_category_id"
    t.index ["question_id"], name: "index_questions_categories_on_question_id"
  end

  create_table "questions_collections", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_questions_collections_on_collection_id"
    t.index ["question_id"], name: "index_questions_collections_on_question_id"
  end

  create_table "stars", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "collection_id"
    t.bigint "question_id"
    t.index ["collection_id"], name: "index_stars_on_collection_id"
    t.index ["question_id"], name: "index_stars_on_question_id"
    t.index ["user_id"], name: "index_stars_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "password_digest"
  end

  add_foreign_key "questions_categories", "categories"
  add_foreign_key "questions_categories", "questions"
  add_foreign_key "questions_collections", "collections"
  add_foreign_key "questions_collections", "questions"
  add_foreign_key "stars", "collections"
  add_foreign_key "stars", "questions"
  add_foreign_key "stars", "users"
end
