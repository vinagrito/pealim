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

ActiveRecord::Schema.define(:version => 20120714113850) do

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hebrew_verbs", :force => true do |t|
    t.integer  "building_id"
    t.integer  "verb_id"
    t.string   "root"
    t.string   "infinitive"
    t.string   "me_past"
    t.string   "you_mas_sing_past"
    t.string   "you_fem_sing_past"
    t.string   "we_past"
    t.string   "you_mas_plu_past"
    t.string   "you_fem_plu_past"
    t.string   "he_past"
    t.string   "she_past"
    t.string   "they_past"
    t.string   "mas_sing_pres"
    t.string   "fem_sing_pres"
    t.string   "mas_plu_pres"
    t.string   "fem_plu_pres"
    t.string   "me_fut"
    t.string   "you_mas_sing_she_fut"
    t.string   "he_fut"
    t.string   "we_fut"
    t.string   "you_fem_sing_fut"
    t.string   "you_plu_fut"
    t.string   "they_fut"
    t.string   "mas_imp"
    t.string   "fem_imp"
    t.string   "plural_imp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hebrew_verbs", ["building_id", "verb_id"], :name => "index_hebrew_verbs_on_building_id_and_verb_id"

  create_table "letters", :force => true do |t|
    t.string   "name"
    t.integer  "num_value"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "verbs", :force => true do |t|
    t.string   "name_eng"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
