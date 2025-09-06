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

ActiveRecord::Schema[8.0].define(version: 2025_09_05_132133) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "change_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "change_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "changes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "business_justification"
    t.text "implmentation_plan"
    t.text "risks"
    t.text "test_plan"
    t.text "rollback_plan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "risk_id", null: false
    t.uuid "change_type_id", null: false
    t.index ["change_type_id"], name: "index_changes_on_change_type_id"
    t.index ["risk_id"], name: "index_changes_on_risk_id"
  end

  create_table "risks", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "changes", "change_types"
  add_foreign_key "changes", "risks"
end
