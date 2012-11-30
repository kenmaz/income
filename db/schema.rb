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

ActiveRecord::Schema.define(:version => 20121130110044) do

  create_table "bonus", :force => true do |t|
    t.integer  "amount"
    t.integer  "age"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bonus", ["age"], :name => "index_bonus_on_age"
  add_index "bonus", ["company_id"], :name => "index_bonus_on_company_id"

  create_table "bonuses", :force => true do |t|
    t.integer  "amount"
    t.integer  "age"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "bonuses", ["age"], :name => "index_bonuses_on_age"
  add_index "bonuses", ["company_id"], :name => "index_bonuses_on_company_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.integer  "company_type_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "companies", ["company_type_id"], :name => "index_companies_on_company_type_id"
  add_index "companies", ["name"], :name => "index_companies_on_name"

  create_table "company_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
