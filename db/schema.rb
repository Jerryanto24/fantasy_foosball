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

ActiveRecord::Schema.define(version: 2019_05_08_125401) do

  create_table "game_types", force: :cascade do |t|
    t.string "game_type_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "game_name", limit: 200
    t.integer "match_id"
    t.integer "home_point"
    t.integer "away_point"
    t.integer "winner_team_id"
    t.integer "loser_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "match_name", limit: 200
    t.integer "game_type_id"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_player_one_id"
    t.integer "home_player_two_id"
    t.integer "away_player_one_id"
    t.integer "away_player_two_id"
    t.integer "winner_team_id"
    t.integer "loser_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name", limit: 200
    t.integer "player_one_id"
    t.integer "player_two_id"
    t.integer "wins_game"
    t.integer "losses_game"
    t.integer "total_game"
    t.integer "wins_match"
    t.integer "losses_match"
    t.integer "total_match"
    t.integer "total_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
