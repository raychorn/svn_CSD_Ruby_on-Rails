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

file = File.open('models.sh', "w")
ActiveRecord::Base.connection.tables.each { |x| file.puts "rails generate model "+x }
file.close

