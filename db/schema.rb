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

ActiveRecord::Schema.define(version: 20172611210919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "railway_stations", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "railway_stations_routes", force: :cascade do |t|
    t.bigint "railway_station_id"
    t.bigint "route_id"
    t.integer "position"
    t.datetime "arrival_time", default: "2018-03-17 22:04:26", null: false
    t.datetime "departure_time", default: "2018-03-18 22:04:26", null: false
    t.index ["railway_station_id"], name: "index_railway_stations_routes_on_railway_station_id"
    t.index ["route_id"], name: "index_railway_stations_routes_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "number"
    t.string "holder_name"
    t.string "passport_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "train_id"
    t.bigint "from_station_id"
    t.bigint "to_station_id"
    t.bigint "user_id"
    t.index ["from_station_id"], name: "index_tickets_on_from_station_id"
    t.index ["to_station_id"], name: "index_tickets_on_to_station_id"
    t.index ["train_id"], name: "index_tickets_on_train_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trains", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.bigint "current_station_id"
    t.boolean "sorted_by_head", default: true, null: false
    t.index ["current_station_id"], name: "index_trains_on_current_station_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wagons", force: :cascade do |t|
    t.integer "number"
    t.integer "top_seats"
    t.integer "bottom_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "train_id"
    t.integer "side_top_seats"
    t.integer "side_bottom_seats"
    t.string "type"
    t.integer "seating_seats"
    t.index ["train_id"], name: "index_wagons_on_train_id"
  end

end
