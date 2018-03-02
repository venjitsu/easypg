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

ActiveRecord::Schema.define(version: 20180302231850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "epgs", force: :cascade do |t|
    t.string "spreadsheet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_schedules", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_schedules_on_event_id"
    t.index ["schedule_id"], name: "index_event_schedules_on_schedule_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "synopsis"
    t.integer "certificate"
    t.integer "genre"
    t.integer "sub_genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_schedules", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "schedule_id"
    t.time "start_time"
    t.index ["event_id"], name: "index_events_schedules_on_event_id"
    t.index ["schedule_id"], name: "index_events_schedules_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.date "date"
    t.boolean "uploaded"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "service_id"
    t.index ["service_id"], name: "index_schedules_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "event_schedules", "events"
  add_foreign_key "event_schedules", "schedules"
  add_foreign_key "events_schedules", "events"
  add_foreign_key "events_schedules", "schedules"
  add_foreign_key "schedules", "services"
end
