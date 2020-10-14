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

ActiveRecord::Schema.define(:version => 20130121151930) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "county"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address_type",     :default => "physical"
    t.string   "room"
    t.string   "name",             :default => ""
  end

  create_table "attachments", :force => true do |t|
    t.string   "file"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "billing_methods", :force => true do |t|
    t.string   "billing_type"
    t.string   "cc_number"
    t.string   "cc_ccv"
    t.string   "billing_name"
    t.date     "cc_exp"
    t.string   "mas90_id"
    t.string   "billable_type"
    t.integer  "billable_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "certifications", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contracts", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "contractable_type"
    t.integer  "contractable_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "criteria_certifications", :force => true do |t|
    t.integer  "job_criteria_id"
    t.integer  "certification_id"
    t.boolean  "required"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "criteria_skills", :force => true do |t|
    t.integer  "job_request_id"
    t.string   "skill_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "insurances", :force => true do |t|
    t.string   "carrier"
    t.string   "account"
    t.integer  "coverage"
    t.integer  "interpreter_id"
    t.string   "insurance_proof"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "interpreter_certifications", :force => true do |t|
    t.string   "certifier"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "comment"
    t.string   "name"
    t.integer  "interpreter_id"
    t.integer  "certification_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "invoice_items", :force => true do |t|
    t.date     "job_date"
    t.string   "calculation_description"
    t.string   "invoice_item_type"
    t.integer  "amount_cents"
    t.integer  "job_assignment_id"
    t.integer  "billing_plan_id"
    t.integer  "contract_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "invoices", :force => true do |t|
    t.date     "period_start"
    t.date     "period_end"
    t.string   "reference"
    t.string   "invoice_type"
    t.integer  "contract_id"
    t.integer  "invoiceable_id"
    t.string   "invoiceable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "job_assignments", :force => true do |t|
    t.string   "status"
    t.datetime "scheduled_start"
    t.datetime "estimated_end"
    t.datetime "actual_start"
    t.datetime "actual_end"
    t.integer  "client_billing_plan_id"
    t.integer  "interpreter_billing_plan_id"
    t.integer  "client_id"
    t.integer  "interpreter_id"
    t.integer  "job_request_id"
    t.integer  "client_invoice_id"
    t.integer  "interpreter_invoice_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "job_offers", :force => true do |t|
    t.integer  "job_request_id"
    t.integer  "person_id"
    t.string   "status"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "job_requests", :force => true do |t|
    t.string   "request_type"
    t.string   "request_status"
    t.datetime "start_datetime"
    t.string   "recurring"
    t.integer  "client_id"
    t.string   "name"
    t.string   "reference"
    t.datetime "start_window"
    t.integer  "estimated_period"
    t.integer  "period_window"
    t.integer  "hourly_max_cents"
    t.integer  "total_max_cents"
    t.string   "gender_range"
    t.string   "job_type"
    t.integer  "percent_interpreting"
    t.integer  "services_for_id"
    t.integer  "onsite_contact_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.text     "description",          :default => ""
    t.float    "duration_in_hours"
  end

  create_table "job_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "notes", :force => true do |t|
    t.text     "comment"
    t.string   "visibility"
    t.string   "notable_type"
    t.integer  "notable_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.string   "formal_name"
    t.string   "org_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "payment_type"
    t.string   "paypal_account"
    t.string   "bank_name"
    t.string   "bank_routing"
    t.string   "bank_account"
    t.string   "mas90_id"
    t.string   "payable_type"
    t.integer  "payable_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "prefix_name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "postfix_name"
    t.string   "preferred_language"
    t.string   "written_languages"
    t.string   "spoken_languages"
    t.string   "gender"
    t.date     "dob"
    t.integer  "user_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.integer  "organization_id"
    t.string   "type"
    t.float    "years_experience"
    t.integer  "miles_willing_to_travel"
  end

  create_table "person_relationships", :force => true do |t|
    t.integer  "to_organization_id"
    t.integer  "from_person_id"
    t.integer  "to_person_id"
    t.string   "relationship_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "pricing_block_periods", :force => true do |t|
    t.datetime "effective_date"
    t.datetime "end_date"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "day_of_week"
    t.integer  "pricing_plan_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "pricing_plans", :force => true do |t|
    t.string   "title"
    t.integer  "interpreter_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "pricing_rate_premiums", :force => true do |t|
    t.datetime "effective_date"
    t.datetime "end_date"
    t.string   "skill"
    t.integer  "additional_amount"
    t.integer  "min_increments"
    t.integer  "pricing_plan_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "pricing_rates", :force => true do |t|
    t.string   "title"
    t.datetime "effective_date"
    t.datetime "end_date"
    t.integer  "hourly_rate"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "day_of_week"
    t.integer  "min_billing_amount"
    t.integer  "overtime_threshold"
    t.integer  "overtime_rate"
    t.integer  "pricing_plan_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "relationships", :force => true do |t|
    t.integer  "from_person_id"
    t.integer  "to_person_id"
    t.integer  "to_organization_id"
    t.string   "relationship_type"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "reminder_times", :force => true do |t|
    t.datetime "alert_time"
    t.datetime "sent_time"
    t.datetime "acknowledged_time"
    t.integer  "reminder_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "reminders", :force => true do |t|
    t.string   "reminder_type"
    t.string   "notification"
    t.integer  "job_assignment_id"
    t.integer  "person_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "skills", :force => true do |t|
    t.string   "skill_type"
    t.float    "experience"
    t.string   "where"
    t.integer  "interpreter_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",      :null => false
    t.string   "encrypted_password",     :default => "",      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "name"
    t.string   "user_type",              :default => "other"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "virtual_addresses", :force => true do |t|
    t.string   "contact_type"
    t.string   "contact_value"
    t.string   "contact_label"
    t.string   "virtual_addressable_type"
    t.integer  "virtual_addressable_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

end
