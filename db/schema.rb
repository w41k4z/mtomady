# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_03_03_230203) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "category_translations", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "supported_language_id", null: false
    t.string "translation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id", "supported_language_id"], name: "idx_on_category_id_supported_language_id_8d00a5313a", unique: true
  end

  create_table "supported_languages", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.index ["code"], name: "index_supported_languages_on_code", unique: true
  end

  create_table "treatment_translations", force: :cascade do |t|
    t.integer "treatment_id", null: false
    t.integer "supported_language_id", null: false
    t.string "translation", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treatment_id", "supported_language_id"], name: "idx_on_treatment_id_supported_language_id_e4f418cc0c", unique: true
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category_id", null: false
    t.integer "state", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "category_translations", "categories"
  add_foreign_key "category_translations", "supported_languages"
  add_foreign_key "treatment_translations", "supported_languages"
  add_foreign_key "treatment_translations", "treatments"
  add_foreign_key "treatments", "categories"
end
