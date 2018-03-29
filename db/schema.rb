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

ActiveRecord::Schema.define(version: 20180329180146) do

  create_table "students", primary_key: "user_id", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "need_parent"
    t.string "parent_firstname"
    t.string "parent_lastname"
    t.index ["user_id"], name: "index_students_on_user_id", unique: true
  end

  create_table "students_tutors", id: false, force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_students_tutors_on_student_id"
    t.index ["tutor_id"], name: "index_students_tutors_on_tutor_id"
  end

  create_table "tutor_sessions", force: :cascade do |t|
    t.string "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.time "starttime"
    t.time "endtime"
    t.float "time_duration"
    t.integer "user_id"
    t.integer "student_id"
    t.integer "tutor_id"
    t.index ["created_at"], name: "index_tutor_sessions_on_user_id_and_created_at"
  end

  create_table "tutors", primary_key: "user_id", force: :cascade do |t|
    t.string "school"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "rate", precision: 4, scale: 2
    t.index ["user_id"], name: "index_tutors_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "gender"
    t.string "role"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "education_level"
  end

end
