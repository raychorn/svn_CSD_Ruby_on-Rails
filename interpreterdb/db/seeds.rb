# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'SETTING UP DEFAULT USER LOGIN'
puts '--- Creating Admin User'
user = User.create! :email => 'admin@c-s-d.org', :password => 'csdp@ss', :password_confirmation => 'csdp@ss'
user.add_role :admin
puts '--- Admin User Created: ' << user.email

user2 = User.create! :email => 'client@c-s-d.org', :password => 'password', :password_confirmation => 'password'
puts '--- New User Created: ' << user2.email
puts '--- Assigning User Details'
puts '--- Applying User to the client'
user2.add_role :client
user2.add_role :client_admin

require File.expand_path('./db/seeds-tblInterpreters.rb')

require File.expand_path('./db/seeds-tblLanguages.rb')

require File.expand_path('./db/seeds-tblInterpLang.rb')

require File.expand_path('./db/seeds-tblScheduleAssignments.rb')

require File.expand_path('./db/seeds-tblPersonalSched.rb')

require File.expand_path('./db/seeds-tblSchedStatus.rb')

require File.expand_path('./db/seeds-tblServicesFor.rb')

puts "DB DATA IMPORT SUCCESSFUL"
