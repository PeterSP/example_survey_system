# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100914183428) do

  create_table "options", :force => true do |t|
    t.integer  "question_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "responses_count", :default => 0, :null => false
  end

  add_index "options", ["question_id"], :name => "index_options_on_question_id"

  create_table "question_requirements", :force => true do |t|
    t.integer  "question_id"
    t.integer  "option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_requirements", ["question_id", "option_id"], :name => "index_question_requirements_on_question_id_and_option_id", :unique => true

  create_table "questions", :force => true do |t|
    t.string   "question",                                         :null => false
    t.string   "help"
    t.integer  "survey_id",                                        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",       :default => "MultipleChoiceQuestion", :null => false
  end

  add_index "questions", ["survey_id"], :name => "index_questions_on_survey_id"

  create_table "responses", :force => true do |t|
    t.integer  "user_survey_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.datetime "created_at"
  end

  create_table "surveys", :force => true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_surveys_count", :default => 0, :null => false
  end

  create_table "user_surveys", :force => true do |t|
    t.integer  "user_id"
    t.integer  "survey_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_surveys", ["user_id", "survey_id"], :name => "index_users_surveys", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "login",                            :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"

end
