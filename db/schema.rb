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

ActiveRecord::Schema.define(version: 20180309214747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "epgs", force: :cascade do |t|
    t.string "spreadsheet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "checksum"
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
    t.bigint "epg_id"
    t.index ["epg_id"], name: "index_schedules_on_epg_id"
    t.index ["service_id"], name: "index_schedules_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "service_id"
    t.index ["service_id"], name: "index_services_users_on_service_id"
    t.index ["user_id"], name: "index_services_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "event_schedules", "events"
  add_foreign_key "event_schedules", "schedules"
  add_foreign_key "events_schedules", "events"
  add_foreign_key "events_schedules", "schedules"
  add_foreign_key "schedules", "epgs"
  add_foreign_key "schedules", "services"
end
