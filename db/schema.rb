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

ActiveRecord::Schema[7.0].define(version: 2023_07_28_101603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "league_tables", force: :cascade do |t|
    t.integer "home_team_score", default: 0
    t.integer "away_team_score", default: 0
    t.bigint "home_team_id"
    t.bigint "away_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["away_team_id"], name: "index_league_tables_on_away_team_id"
    t.index ["home_team_id"], name: "index_league_tables_on_home_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "points", default: 0
    t.integer "scored_goals", default: 0
    t.integer "conceeded_goals", default: 0
    t.integer "wins", default: 0
    t.integer "draws", default: 0
    t.integer "loses", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "league_tables", "teams", column: "away_team_id"
  add_foreign_key "league_tables", "teams", column: "home_team_id"
end
