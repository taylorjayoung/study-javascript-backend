
ActiveRecord::Schema.define(version: 2019_03_01_225638) do

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "message"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_comments_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.string "questionText"
    t.string "answerText"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions_categories",:id => false force: :cascade do |t|
    t.integer "question_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_questions_categories_on_category_id"
    t.index ["question_id"], name: "index_questions_categories_on_question_id"
  end

  create_table "questions_collections",:id => false force: :cascade do |t|
    t.integer "question_id"
    t.integer "collection_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_questions_collections_on_collection_id"
    t.index ["question_id"], name: "index_questions_collections_on_question_id"
  end

end
