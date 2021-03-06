# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_23_190343) do

  create_table "gamestats", force: :cascade do |t|
    t.integer "rps_score"
    t.integer "rps_times"
    t.integer "colortext_score"
    t.integer "colortext_times"
    t.integer "score"
    t.integer "times_played"
    t.integer "presskeytimes_score"
    t.integer "presskeytimes_times"
    t.integer "quickmath_score"
    t.integer "quickmath_times"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gamestat_id"
    t.text "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
