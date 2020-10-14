#!/usr/bin/env ruby

APP_PATH = File.expand_path('./config/application')
puts APP_PATH
require File.expand_path('./config/boot')

puts "Rails was loaded!"

require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :encoding => "utf8",
  :database => "interpreterdb",
  :username => 'root',
  :password => 'peekab00',
  :host => '192.168.1.248',
  :port => 3306
)

puts ActiveRecord::Base.connection.table_structure("tblusers")
