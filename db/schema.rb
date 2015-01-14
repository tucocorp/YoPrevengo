# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130103005544) do

  create_table "activities", :force => true do |t|
    t.string   "description"
    t.integer  "work_flow_id"
    t.integer  "activity_type_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "activity_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authorizations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "company_type"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "criteria_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "damages", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "dangers", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "evaluation_criteries", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "value"
    t.integer  "criteria_type_id"
    t.integer  "company_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "matrix_headers", :force => true do |t|
    t.integer  "unitary_task_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "preventive_procedures", :force => true do |t|
    t.string   "monitoring_time"
    t.integer  "control_amount"
    t.string   "control_responsable"
    t.string   "control_measure"
    t.integer  "risk_matrix_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "risk_matrices", :force => true do |t|
    t.string   "personal_cause"
    t.string   "work_cause"
    t.integer  "consequence"
    t.integer  "probability"
    t.integer  "magnitude"
    t.integer  "risk_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "resposable"
    t.boolean  "generate"
    t.string   "rating"
    t.integer  "matrix_header_id"
  end

  create_table "risks", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "danger_id"
  end

  create_table "risks_damages", :id => false, :force => true do |t|
    t.integer  "risk_id"
    t.integer  "damage_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "unitary_tasks", :force => true do |t|
    t.string   "description"
    t.integer  "activity_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "run"
    t.string   "username",         :null => false
    t.string   "lastname"
    t.string   "surname"
    t.integer  "phono"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_type_id"
  end

  create_table "work_areas", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "work_flows", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "work_area_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
