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

ActiveRecord::Schema.define(version: 2019_07_19_184150) do

  create_table "users", force: :cascade do |t|
    t.string "patient_id"
    t.string "order_provider"
    t.string "order_name"
    t.string "lab_date"
    t.string "lab_ord_dtl"
    t.string "lab_analyte"
    t.string "lab_order_type"
    t.string "lab_value"
    t.string "lab_interpretation"
    t.integer "order_id"
    t.string "order_src"
    t.string "lab_local_temp_list"
    t.string "lab_order_genus"
    t.string "lab_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
