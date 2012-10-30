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

ActiveRecord::Schema.define(:version => 20121022203910) do

  create_table "galleries", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "headline"
    t.string   "description"
    t.boolean  "visible",             :default => true
    t.integer  "position"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "galleries_skills", :id => false, :force => true do |t|
    t.integer "gallery_id"
    t.integer "skill_id"
  end

  add_index "galleries_skills", ["gallery_id", "skill_id"], :name => "index_galleries_skills_on_gallery_id_and_skill_id"
  add_index "galleries_skills", ["skill_id", "gallery_id"], :name => "index_galleries_skills_on_skill_id_and_gallery_id"

  create_table "hobbies", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "description"
    t.boolean  "visible",     :default => true
    t.integer  "position"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "languages", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "level"
    t.string   "additional_information"
    t.boolean  "visible",                :default => true
    t.integer  "position"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "pictures", :force => true do |t|
    t.integer  "gallery_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "head_description"
    t.string   "second_description"
    t.text     "about_me_description"
    t.text     "search_description"
    t.string   "phone"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "projects", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "headline"
    t.string   "description"
    t.boolean  "visible",             :default => true
    t.integer  "position"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "projects_skills", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "skill_id"
  end

  add_index "projects_skills", ["project_id", "skill_id"], :name => "index_projects_skills_on_project_id_and_skill_id"
  add_index "projects_skills", ["skill_id", "project_id"], :name => "index_projects_skills_on_skill_id_and_project_id"

  create_table "recommendations", :force => true do |t|
    t.integer  "profile_id"
    t.text     "content"
    t.string   "author"
    t.string   "relation"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.integer  "profile_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "degree"
    t.string   "field_study"
    t.boolean  "visible",     :default => true
    t.integer  "position"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "skillcategories", :force => true do |t|
    t.integer  "profile_id"
    t.string   "category_name"
    t.integer  "position"
    t.boolean  "visible",       :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "skillcategories_skills", :id => false, :force => true do |t|
    t.integer "skillcategory_id"
    t.integer "skill_id"
  end

  add_index "skillcategories_skills", ["skill_id", "skillcategory_id"], :name => "index_skillcategories_skills_on_skill_id_and_skillcategory_id"
  add_index "skillcategories_skills", ["skillcategory_id", "skill_id"], :name => "index_skillcategories_skills_on_skillcategory_id_and_skill_id"

  create_table "skills", :force => true do |t|
    t.string   "skill_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "socialnetworks", :force => true do |t|
    t.integer  "profile_id"
    t.string   "linkedin_link"
    t.string   "facebook_link"
    t.string   "viadeo_link"
    t.string   "twitter_link"
    t.string   "reachjobs_link"
    t.string   "skype_link"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "resume_file_name"
    t.string   "resume_content_type"
    t.integer  "resume_file_size"
    t.datetime "resume_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "lastname"
    t.string   "firstname"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "workexperiences", :force => true do |t|
    t.integer  "profile_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "company"
    t.string   "job_title"
    t.string   "city"
    t.string   "country"
    t.string   "mission_title"
    t.string   "mission_description"
    t.boolean  "visible",             :default => true
    t.integer  "position"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "workexperiences_skills", :id => false, :force => true do |t|
    t.integer "workexperience_id"
    t.integer "skill_id"
  end

  add_index "workexperiences_skills", ["skill_id", "workexperience_id"], :name => "index_workexperiences_skills_on_skill_id_and_workexperience_id"
  add_index "workexperiences_skills", ["workexperience_id", "skill_id"], :name => "index_workexperiences_skills_on_workexperience_id_and_skill_id"

end
