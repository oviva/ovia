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

ActiveRecord::Schema.define(:version => 20120331083521) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.integer  "asset_file_size"
    t.string   "asset_content_type"
    t.datetime "asset_updated_at"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "thumb"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["user_id"], :name => "index_categories_on_user_id"

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  create_table "images", :force => true do |t|
    t.string   "image_file_name"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.datetime "image_updated_at"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_option_variations", :force => true do |t|
    t.string   "name"
    t.integer  "product_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_option_variations", ["product_option_id"], :name => "index_product_option_variations_on_product_option_id"

  create_table "product_options", :force => true do |t|
    t.string   "name"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_options", ["product_id"], :name => "index_product_options_on_product_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "code"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
    t.integer  "quantity"
    t.boolean  "visible",     :default => false
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "color"
    t.string   "background"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",    :default => false
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "tags_tickets", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "ticket_id"
  end

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "state_id"
  end

  add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"
  add_index "tickets", ["state_id"], :name => "index_tickets_on_state_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "",    :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.boolean  "admin",                                 :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
