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

ActiveRecord::Schema.define(:version => 20121213192922) do

  create_table "cdosysmail_failures", :id => false, :force => true do |t|
    t.datetime "Date of Failure"
    t.integer  "Spid"
    t.string   "From",                   :limit => 100
    t.string   "To",                     :limit => 100
    t.string   "Subject",                :limit => 100
    t.string   "Body",                   :limit => 4000
    t.integer  "iMsg"
    t.integer  "Hr"
    t.string   "Source of Failure"
    t.string   "Description of Failure", :limit => 500
    t.string   "Output from Failure",    :limit => 1000
    t.string   "Comment about Failure",  :limit => 50
  end

  create_table "lss_clients", :id => false, :force => true do |t|
    t.string "Client Code",       :limit => 8
    t.string "F2"
    t.string "Customer Last"
    t.string "Tax Exempt Status"
    t.string "Address Type"
    t.string "Address"
    t.string "Address2"
    t.string "Address3"
    t.string "City"
    t.string "State"
    t.string "Zip"
    t.string "Address1"
    t.string "Address21"
    t.string "Address31"
    t.string "City1"
    t.string "State1"
    t.string "Zip1"
    t.string "Phone Type"
    t.string "Phone1"
    t.string "Phone2"
    t.string "Email"
    t.string "Fax"
    t.string "Contact Name"
    t.string "Rate Type"
    t.string "RateGroup",         :limit => 8
  end

  create_table "lss_clients2", :id => false, :force => true do |t|
    t.string "Client Code",       :limit => 12
    t.string "Customer First"
    t.string "Customer Last"
    t.string "Tax Exempt Status"
    t.string "Address Type"
    t.string "Address"
    t.string "Address2"
    t.string "Address3"
    t.string "City"
    t.string "State"
    t.string "Zip"
  end

  create_table "lss_fname", :id => false, :force => true do |t|
    t.string "Client Code",    :limit => 12
    t.string "Customer First", :limit => 510
  end

  create_table "lss_jobs", :id => false, :force => true do |t|
    t.datetime "ActivityDate"
    t.string   "StartTime",      :limit => 24
    t.string   "EndTime",        :limit => 24
    t.float    "Client Dur"
    t.float    "Staff Dur"
    t.string   "Program",        :limit => 32
    t.string   "Recipient",      :limit => 32
    t.string   "ServiceCode",    :limit => 32
    t.integer  "ServiceGroupID"
    t.string   "Location",       :limit => 32
    t.string   "Language",       :limit => 32
    t.integer  "LanguageID"
    t.string   "Status",         :limit => 32
    t.integer  "StatusID"
    t.integer  "WONum"
    t.string   "RequestedBy"
    t.string   "SvcsReceivedby"
    t.datetime "TouchDate"
    t.string   "TouchUser"
    t.datetime "CreateDate"
    t.string   "CreateUser"
    t.string   "Reminder",       :limit => 512
    t.integer  "ClientLSSID"
    t.string   "ClientFirst"
    t.string   "ClientLast"
    t.string   "Staff"
    t.string   "StaffCode"
    t.string   "StaffFirst"
    t.string   "StaffLast"
    t.integer  "InterpID"
  end

  create_table "lss_terp", :id => false, :force => true do |t|
    t.integer "RowID"
    t.string  "Country"
    t.string  "Cert",         :limit => 32
    t.string  "Gender",       :limit => 32
    t.integer "TempID"
    t.string  "FullName"
    t.string  "FirstName"
    t.string  "LastName"
    t.string  "Availability", :limit => 512
    t.string  "Home",         :limit => 32
    t.string  "Work",         :limit => 32
    t.string  "Cell",         :limit => 32
    t.string  "OtherPhone",   :limit => 32
    t.string  "OtherType",    :limit => 32
    t.string  "Pager",        :limit => 64
  end

  create_table "lss_terplang", :id => false, :force => true do |t|
    t.integer "RowID"
    t.integer "TerpID"
    t.string  "Language", :limit => 510
    t.integer "LangID"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "tblbilledjobstemp", :id => false, :force => true do |t|
    t.datetime "Date"
    t.integer  "JobNumber",                                                              :null => false
    t.integer  "ClientKey"
    t.text     "ServiceLocation",   :limit => 2147483647
    t.string   "ServiceCode",       :limit => 100
    t.integer  "ServiceGrp"
    t.integer  "InterpreterID"
    t.integer  "StatusID"
    t.string   "SchedCode",         :limit => 100
    t.datetime "FromTime"
    t.datetime "EndTime"
    t.string   "Location",          :limit => 100
    t.string   "PageStatus",        :limit => 100
    t.string   "RequestedBy",       :limit => 100
    t.string   "RequestedByPhone",  :limit => 100
    t.string   "PONumber",          :limit => 100
    t.string   "ServicesFor",       :limit => 100
    t.integer  "PersonalSchedCode"
    t.integer  "BillingRateID"
    t.integer  "PayRateID"
    t.float    "TaxRateID"
    t.boolean  "Requested",                                                              :null => false
    t.boolean  "Taxable",                                                                :null => false
    t.float    "TaxRate"
    t.string   "EnteredBy",         :limit => 100
    t.datetime "EnteredDate"
    t.integer  "InvoiceNumber"
    t.datetime "InvoiceDate"
    t.string   "LocationNotes",     :limit => 100
    t.decimal  "TravelTime",                              :precision => 18, :scale => 0
  end

  create_table "tblbillinggroups", :primary_key => "billgroupid", :force => true do |t|
    t.integer "officeid",                    :null => false
    t.string  "billgroupname", :limit => 48
    t.integer "active"
  end

  create_table "tblbillingrates", :primary_key => "billingrateid", :force => true do |t|
    t.integer  "rategroupid"
    t.datetime "datefrom"
    t.datetime "dateto"
    t.integer  "servicegroupid"
    t.string   "servicecode",    :limit => 16
    t.decimal  "rate1st",                      :precision => 19, :scale => 4
    t.decimal  "rate2nd",                      :precision => 19, :scale => 4
    t.decimal  "rate3rd",                      :precision => 19, :scale => 4
    t.integer  "intlevel"
    t.decimal  "rate1stAddl",                  :precision => 19, :scale => 4
    t.decimal  "rate2ndAddl",                  :precision => 19, :scale => 4
    t.decimal  "rate3rdAddl",                  :precision => 19, :scale => 4
    t.decimal  "rate1stIO",                    :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "rate2ndIO",                    :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "rate3rdIO",                    :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "rate1stIOAddl",                :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "rate2ndIOAddl",                :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "rate3rdIOAddl",                :precision => 19, :scale => 4, :default => 0.0
    t.decimal  "adminfee",                     :precision => 19, :scale => 4
    t.decimal  "adminfeeIO",                   :precision => 19, :scale => 4
  end

  add_index "tblbillingrates", ["rategroupid"], :name => "FK_tblBillingRates_tblBillingGroups"

  create_table "tblbillingrules", :id => false, :force => true do |t|
    t.integer  "id",                                                              :null => false
    t.integer  "rategroupid",                                                     :null => false
    t.datetime "datefrom"
    t.datetime "dateto"
    t.string   "rateclass",         :limit => 24
    t.string   "servicecode",       :limit => 128
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "days",              :limit => 12
    t.string   "minlabel",          :limit => 32
    t.integer  "minlength"
    t.string   "mintype",           :limit => 16
    t.string   "firstlabel",        :limit => 32
    t.decimal  "firstrate",                        :precision => 19, :scale => 4
    t.integer  "firstlength"
    t.string   "addllabel",         :limit => 32
    t.decimal  "addlrate",                         :precision => 19, :scale => 4
    t.integer  "increments"
    t.string   "feelabel",          :limit => 32
    t.decimal  "feerate",                          :precision => 19, :scale => 4
    t.integer  "feequantity"
    t.string   "description",       :limit => 128
    t.integer  "servicegroupid"
    t.integer  "payservicegroupid"
    t.string   "payservicecode",    :limit => 24
  end

  create_table "tblcertifications", :primary_key => "certificationsid", :force => true do |t|
    t.integer  "interpreterid"
    t.string   "servicecode",       :limit => 32
    t.datetime "certificationdate"
    t.string   "comments",          :limit => 64
  end

  add_index "tblcertifications", ["interpreterid"], :name => "FK_tblCertifications_tblInterpreters"

  create_table "tblclient", :primary_key => "clientid", :force => true do |t|
    t.integer  "officeid",                                                                            :null => false
    t.boolean  "active",                                                           :default => true
    t.string   "clientabbrev",      :limit => 64
    t.string   "clientname",        :limit => 64
    t.string   "clienttag",         :limit => 16
    t.string   "attn",              :limit => 64
    t.string   "address1",          :limit => 128
    t.string   "address2",          :limit => 128
    t.string   "city",              :limit => 64
    t.string   "state",             :limit => 32
    t.string   "zip",               :limit => 16
    t.string   "country",           :limit => 64
    t.string   "billaddress1",      :limit => 128
    t.string   "billaddress2",      :limit => 128
    t.string   "billcity",          :limit => 64
    t.string   "billstate",         :limit => 32
    t.string   "billzip",           :limit => 16
    t.string   "contact1",          :limit => 64
    t.string   "contact1phone",     :limit => 32
    t.string   "contact2",          :limit => 64
    t.string   "contact2phone",     :limit => 32
    t.string   "fax",               :limit => 32
    t.string   "comments",          :limit => 1024
    t.string   "notes",             :limit => 1024
    t.string   "schedulingnotes",   :limit => 1024
    t.boolean  "taxable",                                                          :default => true,  :null => false
    t.boolean  "porequired",                                                       :default => false, :null => false
    t.string   "defaultpo",         :limit => 32
    t.integer  "billgroupid"
    t.decimal  "minimumunits",                      :precision => 8,  :scale => 4
    t.decimal  "minimumamount",                     :precision => 19, :scale => 4
    t.boolean  "reimburseexpenses",                                                :default => true
    t.integer  "locationid"
    t.string   "terms",             :limit => 32
    t.string   "invoicecycle",      :limit => 32
    t.integer  "taxrateid"
    t.integer  "billto"
    t.integer  "invparamid"
    t.decimal  "miles",                             :precision => 18, :scale => 4
    t.string   "MAS90ID",           :limit => 32
    t.datetime "CreationDate"
    t.integer  "io_billgroupid"
    t.decimal  "io_minunits",                       :precision => 8,  :scale => 4
    t.decimal  "io_minamount",                      :precision => 12, :scale => 4
    t.string   "ipaddress",         :limit => 64
    t.boolean  "ioready"
    t.datetime "iodatechecked"
    t.string   "iocheckedby",       :limit => 64
    t.string   "email",             :limit => 130
    t.string   "sf_acct_id",        :limit => 40
    t.integer  "rate_type"
    t.string   "timezone",          :limit => 50
    t.string   "LSSID",             :limit => 8
  end

  add_index "tblclient", ["billgroupid"], :name => "FK_tblClient_tblBillingGroups"
  add_index "tblclient", ["locationid"], :name => "FK_tblClient_tblLocations"
  add_index "tblclient", ["taxrateid"], :name => "FK_tblClient_tblTaxRates"

  create_table "tblclientio", :primary_key => "clientid", :force => true do |t|
    t.string   "updatedby",      :limit => 64
    t.datetime "updatedate"
    t.string   "businesspoc",    :limit => 128
    t.string   "businessnumber", :limit => 64
    t.string   "techpoc",        :limit => 128
    t.string   "technumber",     :limit => 64
    t.string   "techemail",      :limit => 128
    t.string   "speakerphone",   :limit => 64
    t.string   "equipment",      :limit => 128
    t.string   "software",       :limit => 128
    t.string   "callmethod",     :limit => 64
    t.string   "location1",      :limit => 64
    t.string   "siteip1",        :limit => 64
    t.string   "location2",      :limit => 64
    t.string   "siteip2",        :limit => 64
    t.string   "location3",      :limit => 64
    t.string   "siteip3",        :limit => 64
  end

  create_table "tblclientnotes", :force => true do |t|
    t.boolean  "active",                    :default => true,  :null => false
    t.integer  "clientid"
    t.datetime "datestamp"
    t.string   "addedby",   :limit => 64
    t.boolean  "warning",                   :default => false, :null => false
    t.string   "color",     :limit => 16
    t.string   "message",   :limit => 2048
  end

  create_table "tblcommissionrates", :force => true do |t|
    t.integer  "salesrepid",                                               :null => false
    t.string   "objecttype",  :limit => 12,                                :null => false
    t.integer  "objectid",                                                 :null => false
    t.datetime "startdate",                                                :null => false
    t.datetime "enddate",                                                  :null => false
    t.decimal  "commpercent",               :precision => 12, :scale => 4, :null => false
  end

  create_table "tblemployeestatus", :primary_key => "statusid", :force => true do |t|
    t.integer "officeid"
    t.string  "status",    :limit => 16
    t.integer "Xstatusid"
  end

  create_table "tblevent", :id => false, :force => true do |t|
    t.integer  "id",                         :null => false
    t.integer  "interpreterid"
    t.string   "eventtype",     :limit => 2
    t.datetime "validfrom"
    t.datetime "validuntil"
    t.integer  "weeks",         :limit => 1
    t.integer  "startDDMM"
    t.integer  "endDDMM"
  end

  create_table "tblgeo", :id => false, :force => true do |t|
    t.integer "id",                       :null => false
    t.string  "Country",    :limit => 2
    t.string  "City",       :limit => 64
    t.string  "AccentCity", :limit => 64
    t.string  "Region",     :limit => 2
    t.integer "Population"
    t.float   "Latitude"
    t.float   "Longitude"
  end

  add_index "tblgeo", ["City", "Region"], :name => "idxCityState", :unique => true

  create_table "tblinterplang", :id => false, :force => true do |t|
    t.integer "langid", :null => false
    t.integer "terpid", :null => false
  end

  add_index "tblinterplang", ["langid"], :name => "FK_tblInterpLang_tblLanguages"
  add_index "tblinterplang", ["terpid"], :name => "FK_tblInterpLang_tblInterpreters"

  create_table "tblinterpreters", :primary_key => "interpreterid", :force => true do |t|
    t.integer  "officeid"
    t.string   "interpreterssn",     :limit => 12
    t.string   "gender",             :limit => 12
    t.string   "firstname",          :limit => 32
    t.string   "mi",                 :limit => 4
    t.string   "lastname",           :limit => 32
    t.string   "address1",           :limit => 64
    t.string   "address2",           :limit => 64
    t.string   "city",               :limit => 32
    t.string   "state",              :limit => 32
    t.string   "zip",                :limit => 16
    t.string   "country",            :limit => 64
    t.string   "homephone",          :limit => 16
    t.string   "workphone",          :limit => 16
    t.string   "cellphone",          :limit => 16
    t.string   "pager",              :limit => 16
    t.string   "otherphonetype",     :limit => 32
    t.string   "otherphone",         :limit => 16
    t.string   "comments",           :limit => 1024
    t.datetime "startdate"
    t.datetime "enddate"
    t.string   "certificationlevel", :limit => 4
    t.integer  "statusid"
    t.integer  "paygroupid"
    t.boolean  "active",                             :default => true
    t.integer  "locationid"
    t.string   "username",           :limit => 16
    t.string   "password",           :limit => 32
    t.string   "email",              :limit => 128
    t.string   "email2",             :limit => 128
    t.datetime "liability_exp_date"
    t.datetime "back_check_date"
    t.datetime "tb_test_date"
    t.datetime "birthday_date"
    t.integer  "terpnet_access",                     :default => 0
  end

  add_index "tblinterpreters", ["locationid"], :name => "FK_tblInterpreters_tblLocations"
  add_index "tblinterpreters", ["paygroupid"], :name => "FK_tblInterpreters_tblPayGroups"
  add_index "tblinterpreters", ["statusid"], :name => "FK_tblInterpreters_tblEmployeeStatus"

  create_table "tblinterpreterservice", :id => false, :force => true do |t|
    t.integer "interpreterid",                :null => false
    t.integer "servicegroupid",               :null => false
    t.string  "servicecode",    :limit => 40
    t.string  "allow",          :limit => 1
  end

  create_table "tblinterpsessions", :primary_key => "sessid", :force => true do |t|
    t.integer  "userid"
    t.integer  "officeid"
    t.datetime "lasthit",                          :null => false
    t.boolean  "active",         :default => true, :null => false
    t.integer  "terpnet_access"
  end

  create_table "tblinvoicecycles", :force => true do |t|
    t.string "invoicecycle", :limit => 16
  end

  create_table "tblinvoicelines", :primary_key => "lineitemid", :force => true do |t|
    t.integer "jobnumber"
    t.string  "billorpay", :limit => 1
    t.string  "type",      :limit => 1
    t.boolean "taxable"
    t.integer "itemid"
    t.string  "label",     :limit => 32
    t.decimal "units",                   :precision => 8,  :scale => 4
    t.decimal "rate",                    :precision => 19, :scale => 4
    t.string  "updatedby", :limit => 32
  end

  add_index "tblinvoicelines", ["jobnumber"], :name => "jobnumber"

  create_table "tblinvoices", :id => false, :force => true do |t|
    t.integer  "officeid"
    t.integer  "invoice_no",                                                                    :null => false
    t.string   "invoice_type",   :limit => 2
    t.string   "division_no",    :limit => 2
    t.string   "customer_no",    :limit => 32
    t.datetime "invoice_date"
    t.string   "terms_code",     :limit => 2
    t.string   "tax_schedule",   :limit => 9
    t.string   "sales_code",     :limit => 6
    t.string   "tax_class",      :limit => 2
    t.string   "customer_po_no", :limit => 32
    t.datetime "inv_due_date"
    t.decimal  "taxable_amt",                  :precision => 8, :scale => 2
    t.decimal  "non_tax_amt",                  :precision => 8, :scale => 2
    t.decimal  "sales_tax",                    :precision => 8, :scale => 2
    t.integer  "quantity"
    t.decimal  "price",                        :precision => 8, :scale => 2
    t.boolean  "exported",                                                   :default => false, :null => false
  end

  create_table "tblinvoicetemp", :force => true do |t|
    t.integer  "clientid"
    t.string   "invoicetype",  :limit => 2
    t.datetime "invoice_date"
    t.string   "sales_code",   :limit => 6
    t.decimal  "taxable_amt",               :precision => 8, :scale => 2
    t.decimal  "non_tax_amt",               :precision => 8, :scale => 2
    t.decimal  "sales_tax",                 :precision => 8, :scale => 2
    t.integer  "quantity"
    t.decimal  "price",                     :precision => 8, :scale => 2
    t.boolean  "exported",                                                :default => false
  end

  create_table "tblinvparameters", :primary_key => "invParamID", :force => true do |t|
    t.string "invParam", :limit => 32
  end

  create_table "tbljobsclosedtmp", :id => false, :force => true do |t|
    t.integer "jobnumber", :null => false
  end

  create_table "tbljobtemp", :id => false, :force => true do |t|
    t.integer "JobNumber",     :null => false
    t.integer "InvoiceNumber"
  end

  create_table "tbljobviews", :id => false, :force => true do |t|
    t.integer  "jobnumber",                :null => false
    t.datetime "dateviewed",               :null => false
    t.string   "viewedby",   :limit => 64, :null => false
    t.datetime "editlock"
  end

  add_index "tbljobviews", ["jobnumber"], :name => "IX_tblJobViews"

  create_table "tbllanguages", :force => true do |t|
    t.string  "langname", :limit => 32,                   :null => false
    t.boolean "active",                 :default => true, :null => false
  end

  create_table "tbllineitems", :primary_key => "itemid", :force => true do |t|
    t.integer "officeid",                                                                    :null => false
    t.integer "shift"
    t.string  "itemtype",      :limit => 1
    t.string  "description",   :limit => 48
    t.decimal "defaultamount",               :precision => 19, :scale => 4, :default => 0.0
    t.boolean "active"
  end

  create_table "tbllocations", :primary_key => "locationid", :force => true do |t|
    t.integer "officeid"
    t.string  "locationname",  :limit => 64
    t.boolean "defaultoffice"
  end

  create_table "tblnextinvoice", :primary_key => "officeid", :force => true do |t|
    t.integer "invoiceid"
  end

  create_table "tbloffices", :force => true do |t|
    t.string  "name",          :limit => 64
    t.string  "division",      :limit => 2
    t.string  "salescode",     :limit => 6
    t.string  "salesacct",     :limit => 12
    t.string  "email",         :limit => 128
    t.string  "timezone",      :limit => 50
    t.boolean "active_office"
    t.boolean "top_menu"
  end

  create_table "tblofficesettings", :primary_key => "officeid", :force => true do |t|
    t.boolean "adminfee",        :default => false, :null => false
    t.boolean "enforceminimums", :default => true,  :null => false
    t.integer "increments"
  end

  create_table "tblpaygroups", :primary_key => "paygroupid", :force => true do |t|
    t.integer "officeid"
    t.string  "paygroupname", :limit => 32
    t.integer "active"
  end

  create_table "tblpayrates", :primary_key => "payrateid", :force => true do |t|
    t.integer  "paygroupid",                                                  :null => false
    t.datetime "datefrom"
    t.datetime "dateto"
    t.integer  "servicegroupid"
    t.string   "servicecode",    :limit => 16
    t.decimal  "rate1st",                      :precision => 19, :scale => 4
    t.decimal  "rate2nd",                      :precision => 19, :scale => 4
    t.decimal  "rate3rd",                      :precision => 19, :scale => 4
    t.integer  "intlevel"
  end

  add_index "tblpayrates", ["paygroupid"], :name => "FK_tblPayRates_tblPayGroups"

  create_table "tblpayrules", :id => false, :force => true do |t|
    t.integer  "id",                                                              :null => false
    t.integer  "rategroupid",                                                     :null => false
    t.string   "description",       :limit => 128
    t.datetime "datefrom"
    t.datetime "dateto"
    t.string   "rateclass",         :limit => 24
    t.integer  "servicegroupid"
    t.string   "servicecode",       :limit => 24
    t.integer  "payservicegroupid"
    t.string   "payservicecode",    :limit => 24
    t.datetime "starttime"
    t.datetime "endtime"
    t.string   "days",              :limit => 12
    t.string   "minlabel",          :limit => 32
    t.integer  "minlength"
    t.string   "mintype",           :limit => 16
    t.string   "firstlabel",        :limit => 32
    t.decimal  "firstrate",                        :precision => 19, :scale => 4
    t.integer  "firstlength"
    t.string   "addllabel",         :limit => 32
    t.decimal  "addlrate",                         :precision => 19, :scale => 4
    t.integer  "increments"
    t.string   "feelabel",          :limit => 32
    t.decimal  "feerate",                          :precision => 19, :scale => 4
    t.integer  "feequantity"
  end

  create_table "tblpersonalsched", :primary_key => "personalid", :force => true do |t|
    t.string  "schedulecode", :limit => 32
    t.boolean "paid",                       :default => true, :null => false
    t.integer "officeid"
  end

  create_table "tblplaces", :id => false, :force => true do |t|
    t.integer  "geonameid"
    t.string   "name",             :limit => 400
    t.string   "asciiname",        :limit => 400
    t.string   "alternatenames",   :limit => 8000
    t.float    "latitude"
    t.float    "longitude"
    t.string   "featureclass",     :limit => 2
    t.string   "featurecode",      :limit => 20
    t.string   "countrycode",      :limit => 4
    t.string   "cc2",              :limit => 120
    t.string   "admin1code",       :limit => 40
    t.string   "admin2code",       :limit => 160
    t.string   "admin3code",       :limit => 40
    t.string   "admin4code",       :limit => 40
    t.integer  "population",       :limit => 8
    t.integer  "elevation"
    t.integer  "gtopo30"
    t.string   "timezone",         :limit => 200
    t.datetime "modificationdate"
  end

  create_table "tblreminders", :force => true do |t|
    t.string   "type",      :limit => 12
    t.string   "status",    :limit => 12
    t.datetime "alarmdate"
    t.integer  "userid"
    t.integer  "officeid"
    t.integer  "parentid"
    t.text     "notes",     :limit => 2147483647
  end

  create_table "tblreportoptions", :id => false, :force => true do |t|
    t.string  "report", :limit => 24,                   :null => false
    t.string  "param",  :limit => 24,                   :null => false
    t.string  "label",  :limit => 64
    t.string  "value",  :limit => 64
    t.boolean "active",               :default => true, :null => false
  end

  create_table "tblreportparams", :id => false, :force => true do |t|
    t.string "sessid",     :limit => 32
    t.string "paramtype",  :limit => 16
    t.string "paramvalue", :limit => 32
  end

  create_table "tblrequestedinterpreter", :primary_key => "requestid", :force => true do |t|
    t.integer "servicesforid"
    t.integer "interpreterid"
    t.string  "servicecode",      :limit => 16
    t.integer "preferencenumber", :limit => 2
  end

  add_index "tblrequestedinterpreter", ["interpreterid"], :name => "FK_tblRequestedInterpreter_tblInterpreters"
  add_index "tblrequestedinterpreter", ["servicesforid"], :name => "FK_tblRequestedInterpreter_tblServicesFor"

  create_table "tblrptuserlog", :id => false, :force => true do |t|
    t.integer  "logID",                    :null => false
    t.string   "username",   :limit => 50
    t.string   "reportURL"
    t.datetime "DateTime"
    t.string   "LocationID", :limit => 18
    t.string   "ip",         :limit => 15
  end

  create_table "tblsalesreps", :force => true do |t|
    t.string  "name",       :limit => 64
    t.boolean "active",                   :default => true, :null => false
    t.integer "rep_office", :limit => 1,  :default => 0,    :null => false
    t.integer "rep_client", :limit => 1,  :default => 0,    :null => false
    t.integer "rep_interp", :limit => 1,  :default => 0,    :null => false
  end

  create_table "tblschedstatus", :primary_key => "statusid", :force => true do |t|
    t.integer "officeid"
    t.string  "schedstatus",    :limit => 32
    t.string  "schedgroup",     :limit => 32
    t.boolean "isdefault",                    :default => false
    t.boolean "hold"
    t.boolean "processbilling"
    t.boolean "processpay"
    t.boolean "credit"
    t.boolean "interpOption"
    t.string  "bgcolor",        :limit => 7
    t.string  "fgcolor",        :limit => 7
    t.boolean "active"
  end

  create_table "tblscheduleassignments", :primary_key => "jobnumber", :force => true do |t|
    t.datetime "date"
    t.string   "timezone",         :limit => 16
    t.integer  "officeid"
    t.integer  "locationid"
    t.boolean  "flagio",                                                               :default => false,                  :null => false
    t.integer  "servicegroupid"
    t.integer  "clientid"
    t.integer  "interpreterid"
    t.integer  "statusid"
    t.integer  "billinggroupid"
    t.integer  "paygroupid"
    t.integer  "personalid"
    t.integer  "servicesforid"
    t.integer  "taxrateid"
    t.decimal  "taxrate",                                :precision => 8, :scale => 4, :default => 0.0
    t.boolean  "taxable",                                                              :default => true
    t.integer  "languageid"
    t.datetime "fromtime"
    t.datetime "endtime"
    t.string   "servicecode",      :limit => 16
    t.string   "requestedby",      :limit => 64
    t.string   "requestedbyphone", :limit => 64
    t.string   "pagestatus",       :limit => 64
    t.string   "ponumber",         :limit => 64
    t.boolean  "requested"
    t.string   "enteredby",        :limit => 32
    t.datetime "entereddate"
    t.integer  "invoicenumber"
    t.datetime "invoicedate"
    t.text     "notes_interp",     :limit => 2147483647
    t.text     "notes_scheduler",  :limit => 2147483647
    t.text     "notes_invoice",    :limit => 2147483647
    t.boolean  "closed",                                                               :default => false,                  :null => false
    t.datetime "dateclosed"
    t.datetime "payrolldate"
    t.boolean  "lockrates",                                                            :default => false,                  :null => false
    t.boolean  "interpChanged",                                                        :default => false
    t.string   "codeflags",        :limit => 20,                                       :default => "--------------------"
    t.string   "address",          :limit => 128
    t.string   "city",             :limit => 64
    t.string   "state",            :limit => 2
    t.string   "zipcode",          :limit => 16
    t.boolean  "sameloc"
    t.string   "rateclass",        :limit => 24
    t.integer  "parentid"
  end

  add_index "tblscheduleassignments", ["billinggroupid"], :name => "FK_tblScheduleAssignments_tblBillingGroups"
  add_index "tblscheduleassignments", ["clientid"], :name => "FK_tblScheduleAssignments_tblClient"
  add_index "tblscheduleassignments", ["fromtime"], :name => "idxTSAFromtime"
  add_index "tblscheduleassignments", ["interpreterid", "fromtime", "endtime"], :name => "idxInterpreter"
  add_index "tblscheduleassignments", ["locationid"], :name => "FK_tblScheduleAssignments_tblLocations"
  add_index "tblscheduleassignments", ["officeid"], :name => "idxTSAofficeid"
  add_index "tblscheduleassignments", ["paygroupid"], :name => "FK_tblScheduleAssignments_tblPayGroups"
  add_index "tblscheduleassignments", ["personalid"], :name => "FK_tblScheduleAssignments_tblPersonalSched"
  add_index "tblscheduleassignments", ["servicesforid"], :name => "FK_tblScheduleAssignments_tblServicesFor"
  add_index "tblscheduleassignments", ["taxrateid"], :name => "FK_tblScheduleAssignments_tblTaxRates"

  create_table "tblscheduleassignmentslog", :force => true do |t|
    t.integer  "jobnumber",                                                            :null => false
    t.datetime "datestamp"
    t.string   "changedby",        :limit => 64
    t.string   "remoteip",         :limit => 32
    t.string   "changeaction",     :limit => 48
    t.string   "changedetail",     :limit => 256
    t.datetime "date"
    t.string   "timezone",         :limit => 12
    t.integer  "officeid"
    t.integer  "locationid"
    t.boolean  "flagio"
    t.integer  "servicegroupid"
    t.integer  "clientid"
    t.integer  "interpreterid"
    t.integer  "statusid"
    t.integer  "billinggroupid"
    t.integer  "paygroupid"
    t.integer  "personalid"
    t.integer  "servicesforid"
    t.integer  "taxrateid"
    t.decimal  "taxrate",                                :precision => 8, :scale => 4
    t.boolean  "taxable"
    t.integer  "languageid"
    t.datetime "fromtime"
    t.datetime "endtime"
    t.string   "servicecode",      :limit => 16
    t.string   "requestedby",      :limit => 64
    t.string   "requestedbyphone", :limit => 64
    t.string   "pagestatus",       :limit => 64
    t.string   "ponumber",         :limit => 64
    t.boolean  "requested"
    t.string   "enteredby",        :limit => 32
    t.datetime "entereddate"
    t.integer  "invoicenumber"
    t.datetime "invoicedate"
    t.string   "locationnotes",    :limit => 64
    t.text     "servicelocation",  :limit => 2147483647
    t.boolean  "closed"
    t.boolean  "interpChanged"
    t.text     "internalnotes",    :limit => 2147483647
    t.string   "address",          :limit => 128
    t.string   "city",             :limit => 64
    t.string   "state",            :limit => 2
    t.string   "zipcode",          :limit => 16
    t.boolean  "sameloc"
    t.text     "interpnotes",      :limit => 2147483647
  end

  add_index "tblscheduleassignmentslog", ["jobnumber"], :name => "idxJobnumber"

  create_table "tblservicecode", :id => false, :force => true do |t|
    t.string  "servicecode",        :limit => 32,                   :null => false
    t.integer "officeid",                                           :null => false
    t.boolean "active",                           :default => true, :null => false
    t.string  "servicedescription", :limit => 64
    t.integer "servicegroupid"
  end

  add_index "tblservicecode", ["servicegroupid"], :name => "FK_tblServiceCode_tblServiceGroup"

  create_table "tblservicegroup", :primary_key => "servicegroupid", :force => true do |t|
    t.integer "officeid"
    t.string  "servicegroup",       :limit => 16
    t.string  "servicedescription", :limit => 64
  end

  create_table "tblservicesfor", :primary_key => "servicesforid", :force => true do |t|
    t.boolean "active",                        :default => true
    t.integer "officeid"
    t.string  "firstname",     :limit => 64
    t.string  "lastname",      :limit => 64
    t.string  "address1",      :limit => 128
    t.string  "address2",      :limit => 128
    t.string  "city",          :limit => 64
    t.string  "state",         :limit => 32
    t.string  "zip",           :limit => 16
    t.string  "phone",         :limit => 16
    t.string  "altphonedesc",  :limit => 32
    t.string  "altphone",      :limit => 16
    t.boolean "preferred",                     :default => false, :null => false
    t.string  "comments",      :limit => 1024
    t.string  "schedcomments", :limit => 1024
    t.string  "email",         :limit => 128
    t.boolean "warn",                          :default => false
  end

  create_table "tblsessions", :primary_key => "sessid", :force => true do |t|
    t.integer  "userid"
    t.integer  "officeid"
    t.integer  "userlevel"
    t.datetime "lasthit"
    t.datetime "startdate"
    t.datetime "enddate"
    t.integer  "interpreterid"
    t.string   "clientid",         :limit => 250
    t.integer  "consumerid"
    t.integer  "pagesize"
    t.integer  "closed"
    t.string   "sortby",           :limit => 16
    t.integer  "ioonly"
    t.string   "dayofweek",        :limit => 14
    t.integer  "locationid"
    t.string   "requestedby",      :limit => 100
    t.string   "mas90id",          :limit => 20
    t.string   "requestedbyphone", :limit => 20
  end

  create_table "tblshifttimes", :id => false, :force => true do |t|
    t.integer "officeid"
    t.string  "Rate1Start", :limit => 12
    t.string  "Rate2Start", :limit => 12
    t.string  "Rate3Start", :limit => 12
  end

  create_table "tblskillassign", :force => true do |t|
    t.integer  "objectid",                  :null => false
    t.string   "objecttype",  :limit => 12, :null => false
    t.integer  "skillid",                   :null => false
    t.datetime "dateissued"
    t.datetime "dateexpires"
  end

  create_table "tblskills", :force => true do |t|
    t.integer "officeid",                :null => false
    t.string  "skillname", :limit => 64, :null => false
    t.boolean "active",                  :null => false
  end

  create_table "tbltaxrates", :primary_key => "taxrateid", :force => true do |t|
    t.integer "officeid"
    t.string  "taxcode",  :limit => 8
    t.string  "taxdesc",  :limit => 32
    t.decimal "taxrate",                :precision => 8, :scale => 4
  end

  create_table "tblterms", :primary_key => "termsID", :force => true do |t|
    t.string  "terms",    :limit => 32
    t.integer "termdays"
    t.boolean "default",                :default => false, :null => false
  end

  create_table "tblusergroups", :force => true do |t|
    t.string  "groupname",     :limit => 50
    t.boolean "sys_admin"
    t.boolean "all_locations"
    t.boolean "all_interps"
    t.boolean "access_ctrl"
    t.boolean "rw_billing"
    t.boolean "rw_pay"
    t.boolean "rw_schedule"
    t.boolean "rw_reports"
    t.boolean "rw_profiles"
    t.boolean "read_only"
    t.boolean "rw_commission",               :default => false
  end

  create_table "tblversions", :force => true do |t|
    t.integer "major"
    t.integer "minor"
    t.integer "sub"
    t.string  "description", :limit => 1024
  end

  create_table "temp_mailinglist", :id => false, :force => true do |t|
    t.integer "clientid",                    :null => false
    t.string  "clientabbrev", :limit => 64
    t.string  "clientname",   :limit => 64
    t.string  "attn",         :limit => 64
    t.string  "address1",     :limit => 128
    t.string  "address2",     :limit => 128
    t.string  "city",         :limit => 64
    t.string  "state",        :limit => 32
    t.string  "zip",          :limit => 16
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

end
