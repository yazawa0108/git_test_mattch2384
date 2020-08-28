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

ActiveRecord::Schema.define(version: 2020_08_28_063438) do

  create_table "applicants", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "applicant_user_id"
    t.bigint "event_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_user_id"], name: "index_applicants_on_applicant_user_id"
    t.index ["event_id"], name: "index_applicants_on_event_id"
  end

  create_table "event_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "owner_id"
    t.date "start_day"
    t.date "end_day"
    t.bigint "prefecture_id"
    t.string "address"
    t.integer "daily_wage"
    t.text "detail"
    t.bigint "event_status_id", default: 1
    t.bigint "position_id"
    t.integer "assign_num", null: false
    t.string "place_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "work_start_time"
    t.datetime "work_end_time"
    t.index ["event_status_id"], name: "index_events_on_event_status_id"
    t.index ["owner_id"], name: "index_events_on_owner_id"
    t.index ["position_id"], name: "index_events_on_position_id"
    t.index ["prefecture_id"], name: "index_events_on_prefecture_id"
  end

  create_table "positions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "prefecture_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "prefecture_kana"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", limit: 191, default: "", null: false
    t.string "encrypted_password", limit: 191, default: "", null: false
    t.string "reset_password_token", limit: 191
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "profile_image"
    t.date "birthday"
    t.integer "gender"
    t.text "achievement"
    t.integer "betray_flg", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applicants", "events"
  add_foreign_key "applicants", "users", column: "applicant_user_id"
  add_foreign_key "events", "event_statuses"
  add_foreign_key "events", "positions"
  add_foreign_key "events", "prefectures"
  add_foreign_key "events", "users", column: "owner_id"
end
