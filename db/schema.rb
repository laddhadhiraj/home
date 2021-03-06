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

ActiveRecord::Schema.define(version: 20170129094354) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "appointment_start_time"
    t.string   "appointment_end_time"
    t.string   "patient_full_name"
    t.string   "patient_mobile_phone"
    t.string   "patient_home_phone"
    t.string   "patient_email"
    t.string   "patient_full_address"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "integrations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "software_type"
    t.string   "software_username"
    t.string   "software_api_key"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["user_id"], name: "index_integrations_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "patient_full_name"
    t.string   "patient_first_name"
    t.string   "patient_last_name"
    t.string   "patient_dob"
    t.string   "patient_mobile_phone"
    t.string   "patient_home_phone"
    t.string   "patient_work_phone"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
