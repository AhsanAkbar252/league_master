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

ActiveRecord::Schema.define(version: 2023_04_03_021948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "division_referees", force: :cascade do |t|
    t.bigint "referee_level_id", null: false
    t.bigint "division_id", null: false
    t.bigint "referee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_division_referees_on_division_id"
    t.index ["referee_id"], name: "index_division_referees_on_referee_id"
    t.index ["referee_level_id"], name: "index_division_referees_on_referee_level_id"
  end

  create_table "divisions", force: :cascade do |t|
    t.string "name"
    t.string "division_type"
    t.bigint "league_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_divisions_on_league_id"
  end

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.string "state"
    t.bigint "venue_id", null: false
    t.bigint "home_team_id", null: false
    t.bigint "away_team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_games_on_away_team_id"
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["venue_id"], name: "index_games_on_venue_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "time"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_goals_on_game_id"
    t.index ["player_id"], name: "index_goals_on_player_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.string "state"
    t.bigint "referee_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_invitations_on_game_id"
    t.index ["referee_id"], name: "index_invitations_on_referee_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "presences", force: :cascade do |t|
    t.string "state"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_presences_on_game_id"
    t.index ["player_id"], name: "index_presences_on_player_id"
  end

  create_table "red_cards", force: :cascade do |t|
    t.integer "time"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_red_cards_on_game_id"
    t.index ["player_id"], name: "index_red_cards_on_player_id"
  end

  create_table "referee_levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "referee_pays", force: :cascade do |t|
    t.integer "amount"
    t.bigint "referee_position_id", null: false
    t.bigint "referee_level_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["referee_level_id"], name: "index_referee_pays_on_referee_level_id"
    t.index ["referee_position_id"], name: "index_referee_pays_on_referee_position_id"
  end

  create_table "referee_positions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "referee_sets", force: :cascade do |t|
    t.bigint "referee_position_id", null: false
    t.bigint "referee_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_referee_sets_on_game_id"
    t.index ["referee_id"], name: "index_referee_sets_on_referee_id"
    t.index ["referee_position_id"], name: "index_referee_sets_on_referee_position_id"
  end

  create_table "referees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_players", force: :cascade do |t|
    t.integer "number"
    t.bigint "player_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_team_players_on_player_id"
    t.index ["team_id"], name: "index_team_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "division_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_teams_on_division_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "yellow_cards", force: :cascade do |t|
    t.integer "time"
    t.bigint "player_id", null: false
    t.bigint "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_yellow_cards_on_game_id"
    t.index ["player_id"], name: "index_yellow_cards_on_player_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "division_referees", "divisions"
  add_foreign_key "division_referees", "referee_levels"
  add_foreign_key "division_referees", "referees"
  add_foreign_key "divisions", "leagues"
  add_foreign_key "games", "teams", column: "away_team_id"
  add_foreign_key "games", "teams", column: "home_team_id"
  add_foreign_key "games", "venues"
  add_foreign_key "goals", "games"
  add_foreign_key "goals", "players"
  add_foreign_key "invitations", "games"
  add_foreign_key "invitations", "referees"
  add_foreign_key "presences", "games"
  add_foreign_key "presences", "players"
  add_foreign_key "red_cards", "games"
  add_foreign_key "red_cards", "players"
  add_foreign_key "referee_pays", "referee_levels"
  add_foreign_key "referee_pays", "referee_positions"
  add_foreign_key "referee_sets", "games"
  add_foreign_key "referee_sets", "referee_positions"
  add_foreign_key "referee_sets", "referees"
  add_foreign_key "team_players", "players"
  add_foreign_key "team_players", "teams"
  add_foreign_key "teams", "divisions"
  add_foreign_key "yellow_cards", "games"
  add_foreign_key "yellow_cards", "players"
end
