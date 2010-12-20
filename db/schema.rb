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

ActiveRecord::Schema.define(:version => 20101218115332) do

  create_table "authors", :force => true do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # unrecognized index "index_authors_on_name" with type ActiveRecord::ConnectionAdapters::IndexDefinition

  create_table "branches", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "phone"
    t.string   "email"
    t.string   "is_a"
    t.integer  "parent_id"
    t.string   "parent_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "division"
  end

  # unrecognized index "index_categories_on_name_and_division" with type ActiveRecord::ConnectionAdapters::IndexDefinition

  create_table "ibtr_versions", :force => true do |t|
    t.integer  "ibtr_id"
    t.integer  "version"
    t.integer  "title_id"
    t.integer  "member_id"
    t.string   "card_id"
    t.integer  "branch_id"
    t.integer  "rns_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "respondent_id"
  end

  # unrecognized index "index_ibtr_versions_on_ibtr_id" with type ActiveRecord::ConnectionAdapters::IndexDefinition

  create_table "ibtrs", :force => true do |t|
    t.integer  "title_id"
    t.integer  "member_id"
    t.string   "card_id"
    t.integer  "branch_id"
    t.integer  "rns_id"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
    t.string   "respondent_id"
  end

  create_table "memberships", :force => true do |t|
    t.string  "card_id"
    t.integer "member_id"
    t.string  "member"
    t.string  "city"
    t.integer "plan_id"
    t.string  "plan"
    t.integer "inactive"
  end

  # unrecognized index "index_memberships_on_card_id" with type ActiveRecord::ConnectionAdapters::IndexDefinition
  # unrecognized index "index_memberships_on_card_id_and_member_id" with type ActiveRecord::ConnectionAdapters::IndexDefinition
  # unrecognized index "index_memberships_on_member_id" with type ActiveRecord::ConnectionAdapters::IndexDefinition

  create_table "publishers", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # unrecognized index "index_publishers_on_name" with type ActiveRecord::ConnectionAdapters::IndexDefinition

  create_table "stock", :id => false, :force => true do |t|
    t.integer "title_id"
    t.integer "branch_id"
    t.integer "total"
    t.integer "in_store"
    t.integer "in_circulation"
    t.integer "unavailable"
  end

  create_table "titles", :force => true do |t|
    t.string   "title",             :null => false
    t.integer  "author_id"
    t.integer  "publisher_id"
    t.integer  "yearofpublication"
    t.integer  "edition"
    t.integer  "category_id"
    t.string   "isbn10"
    t.string   "isbn13"
    t.integer  "noofpages"
    t.string   "language"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # unrecognized index "index_titles_on_author_id" with type ActiveRecord::ConnectionAdapters::IndexDefinition
  # unrecognized index "index_titles_on_publisher_id" with type ActiveRecord::ConnectionAdapters::IndexDefinition
  # unrecognized index "index_titles_on_title" with type ActiveRecord::ConnectionAdapters::IndexDefinition

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  # unrecognized index "index_users_on_reset_password_token" with type ActiveRecord::ConnectionAdapters::IndexDefinition
  # unrecognized index "index_users_on_username" with type ActiveRecord::ConnectionAdapters::IndexDefinition

end
