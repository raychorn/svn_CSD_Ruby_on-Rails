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


puts 'SETTING UP DUMMY CLIENT'
puts '--- Creating Client Organization'
org1 = Organization.create! name: "Org", formal_name: "Organization One, Inc."
org1.build_mailing_address city: 'Austin', county: 'Travis', state: 'TX', street: '13145 N HWY 183', street2: '#227', zip: '78750'
org1.schedulable_locations.build city: 'Austin', county: 'Travis', state: 'TX', street: '13145 N HWY 183', street2: '#227', zip: '78750', name: 'Ben\'s Place'
org1.schedulable_locations.build city: 'Austin', county: 'Travis', state: 'TX', street: '8701 Bluffstone Cove', street2: '#4304', zip: '78759', name: 'Brad\'s Place'
org1.save!

puts '--- Creating Client'
client1 = Client.create! gender: "female", first_name: "Aclient", middle_name: "", last_name: "One"
client1.build_mailing_address city: 'Austin', county: 'Travis', state: 'TX', street: '13145 N HWY 183', street2: '#227', zip: '78750'
client1.mailing_address.save!
client1.organization = org1

puts '--- Creating up job_requests'
10.times.each do |i|
  jr = JobRequest.create! request_type: 'site', request_status: 'pending', start_datetime: (i-3).day.from_now, recurring: 'none', client_id: client1.id, name: "Test request#{i}", estimated_period: 3600, hourly_max_cents: '3000', total_max_cents: '4500', physical_address_attributes: {street: "#{i}00 Congress Ave", street2: "Ste. #{i}01", city: "Austin", state: "TX", zip: "78701"}
  client1.job_requests << jr
end

puts '--- Creating Client User'
user2 = User.create! :email => 'client@c-s-d.org', :password => 'password', :password_confirmation => 'password'
puts '--- New User Created: ' << user2.email
puts '--- Assigning User Details'
puts '--- Applying User to the client'
user2.person = client1
user2.add_role :client
user2.add_role :client_admin

puts 'CLIENT CREATION SUCCESSFUL'


puts 'SETTING UP SOME CERTIFICATIONS'

c1 = Certification.create! name: "Medical"
c2 = Certification.create! name: "Court Room"
c3 = Certification.create! name: "Banking"
c4 = Certification.create! name: "Education"
c5 = Certification.create! name: "CSD Certified"


["1-1", "Business Meeting", "Speech", "Performance", "Music", "Legal", "Medical"].each do |item|
  JobType.create! title: item
end


puts 'SETTING UP SOME INTERPRETERS'
#Monkeypatch classes to allow setting of attributes not normally accessible
class Address
  attr_accessible :address_type
end
class Person
  attr_accessible :type
end
InterpreterCertification
class InterpreterCertification
  attr_accessible :certification
end


p1 = Person.create! type: "Interpreter", gender: "female", first_name: "Test", middle_name: "", last_name: "Interpreter", mailing_address_attributes: {street: "100 Congress Ave", street2: " #2311", city: "Austin", state: "TX", zip: "78701"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "123-4567"}, {contact_label: "cell", contact_type: "voice", contact_value: "567-8901"}, {contact_label: "home", contact_type: "email", contact_value: "test-terp@c-s-d.org"}]

i1 = p1.becomes(Interpreter)

puts '--- Creating Interpreter User'
user3 = User.create! :email => 'interpreter@c-s-d.org', :password => 'password', :password_confirmation => 'password'
user3.person = i1
user3.add_role :interpreter
puts '--- New User Created: ' << user3.email


plan = i1.build_pricing_plan
plan.pricing_rates.build :day_of_week => :monday, :start_time => Time.at(8.hours).utc, :end_time => Time.at(17.hours).utc
plan.pricing_rates.build :day_of_week => :monday, :start_time => Time.at(17.hours).utc, :end_time => Time.at(18.hours).utc
plan.pricing_rates.build :day_of_week => :monday, :start_time => Time.at(19.hours).utc, :end_time => Time.at(24.hours).utc
plan.save!


puts 'SETTING UP SOME REAL INTERPRETER DATA'
Person.create! type: "Interpreter", gender: "female", first_name: "Toni", middle_name: "", last_name: "Abadi", mailing_address_attributes: {street: "360 Nueces Street", street2: " #2311", city: "Austin", state: "TX", zip: "78701"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "329-0095"}, {contact_label: "cell", contact_type: "voice", contact_value: "663-4314"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-6614"}, {contact_label: "home", contact_type: "email", contact_value: "5128485077@vtext.com;toniabadi@hotmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Donna", middle_name: "", last_name: "Alexander", mailing_address_attributes: {street: "1904 Goodrich Ave #12", street2: "", city: "Austin", state: "TX", zip: "78704"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "442-6429"}, {contact_label: "cell", contact_type: "voice", contact_value: "658-9623"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-4442"}, {contact_label: "home", contact_type: "email", contact_value: "dalexander36@att.blackberry.net"}, {contact_label: "email2", contact_type: "email", contact_value: "DALEXANDER36@austin.rr.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Deborah", middle_name: "", last_name: "Anderson", mailing_address_attributes: {street: "6418 Gray Ridge", street2: "", city: "San Antonio", state: "TX", zip: "78233"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "210-845-1333"}, {contact_label: "cell", contact_type: "voice", contact_value: "210-835-4195"}, {contact_label: "home", contact_type: "email", contact_value: "2108354195@messaging.sprintpcs.com"}, {contact_label: "email2", contact_type: "email", contact_value: "debisasling@yahoo.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Milly", middle_name: "", last_name: "Atherton", mailing_address_attributes: {street: "2515 Proctor", street2: "", city: "Waco", state: "TX", zip: "76708"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 752-6924"}, {contact_label: "work", contact_type: "voice", contact_value: "254-867-3646"}, {contact_label: "home", contact_type: "email", contact_value: "2547173881@mmode.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Claudia", middle_name: "", last_name: "Attaway", mailing_address_attributes: {street: "739 Hwy 7", street2: "", city: "Eddy", state: "TX", zip: "76524"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254)366-6875"}, {contact_label: "home", contact_type: "email", contact_value: "2543666875@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "cvattaway@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Larry", middle_name: "", last_name: "Barnett", mailing_address_attributes: {street: "137 Johnny's Way", street2: "", city: "Kyle", state: "TX", zip: "78640"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-268-8791"}, {contact_label: "cell", contact_type: "voice", contact_value: "461-2384"}, {contact_label: "pager", contact_type: "pager", contact_value: "875-1393"}, {contact_label: "home", contact_type: "email", contact_value: "HLBarnett@Austin.RR.Com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Katie", middle_name: "", last_name: "Bays", mailing_address_attributes: {street: "205 Windmill Circle", street2: "", city: "Leander", state: "TX", zip: "78641"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "259-8913"}, {contact_label: "cell", contact_type: "voice", contact_value: "470-5813"}, {contact_label: "home", contact_type: "email", contact_value: "5124705813@vtext.com"}, {contact_label: "email2", contact_type: "email", contact_value: "katiegbays@yahoo.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Tresa", middle_name: "", last_name: "Beard", mailing_address_attributes: {street: "14 Sunshine Circle", street2: "", city: "Wimberly", state: "TX", zip: "78676"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "246-7504"}, {contact_label: "cell", contact_type: "voice", contact_value: "680-7504"}, {contact_label: "home", contact_type: "email", contact_value: "tresalasha@yahoo.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Sue", middle_name: "", last_name: "Boesen", mailing_address_attributes: {street: "2545 B York Creek Road", street2: "", city: "New Braunfels", state: "TX", zip: "78130"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-288-3353"}, {contact_label: "cell", contact_type: "voice", contact_value: "512-627-3556"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-3353"}, {contact_label: "home", contact_type: "email", contact_value: "5126273556@vtext.com"}, {contact_label: "email2", contact_type: "email", contact_value: "slboesen@gmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Diane", middle_name: "J", last_name: "Boles", mailing_address_attributes: {street: "1333 Western Oaks Dr.", street2: "", city: "Woodway", state: "TX", zip: "76712"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "254-420-3506"}, {contact_label: "work", contact_type: "voice", contact_value: "254-299-8726"}, {contact_label: "cell", contact_type: "voice", contact_value: "479-952-2278"}, {contact_label: "home", contact_type: "email", contact_value: "dboles@mclennan.edu"}, {contact_label: "email2", contact_type: "email", contact_value: "2544982137@vtext.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Lynn", middle_name: "", last_name: "Bourgeois", mailing_address_attributes: {street: "2700 Turnersville Rd", street2: "", city: "Buda", state: "TX", zip: "78610"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "243-2889"}, {contact_label: "cell", contact_type: "voice", contact_value: "297-3199"}, {contact_label: "home", contact_type: "email", contact_value: "5122973199@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "terpbourgeois@gmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Linda", middle_name: "", last_name: "Ceremano", mailing_address_attributes: {street: "1402 Glencrest Dr.", street2: "", city: "Austin", state: "TX", zip: "78723"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "451-9460"}, {contact_label: "cell", contact_type: "voice", contact_value: "512-470-9460"}, {contact_label: "home", contact_type: "email", contact_value: "5124709460@vtext.com"}, {contact_label: "email2", contact_type: "email", contact_value: "llmano50@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Billy", middle_name: "", last_name: "Collins", mailing_address_attributes: {street: "500 E Riverside Dr  #241", street2: "", city: "Austin", state: "TX", zip: "78704"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "440-0801"}, {contact_label: "cell", contact_type: "voice", contact_value: "423-4591"}, {contact_label: "pager", contact_type: "pager", contact_value: "339-6328"}, {contact_label: "home", contact_type: "email", contact_value: "5124234591@txt.att.net;Billyterp@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "bdcj@austin.rr.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Mark", middle_name: "", last_name: "Davidson", mailing_address_attributes: {street: "6508 Boleynwood", street2: "", city: "Austin", state: "TX", zip: "78745"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-302-5647"}, {contact_label: "cell", contact_type: "voice", contact_value: "512-921-4001"}, {contact_label: "home", contact_type: "email", contact_value: "5129214001@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "mjdavidson15@aol.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Kelly", middle_name: "", last_name: "De Silva", mailing_address_attributes: {street: "502 Terrace Canyon Dr", street2: "", city: "Dripping Springs", state: "TX", zip: "78620"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-858-1582"}, {contact_label: "cell", contact_type: "voice", contact_value: "619-9625"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-6019"}, {contact_label: "home", contact_type: "email", contact_value: "Kelly12desilva@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "5126199625@vtext.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Francine", middle_name: "", last_name: "Dellinger", mailing_address_attributes: {street: "218 Bradfield Drive", street2: "", city: "Buda", state: "TX", zip: "78610"}, virtual_addresses_attributes: [{contact_label: "cell", contact_type: "voice", contact_value: "512.297.6994"}, {contact_label: "home", contact_type: "email", contact_value: "gandfdell@aol.com; 5122976994@messaging.sprintpcs.com"}, {contact_label: "email2", contact_type: "email", contact_value: "5122976994@messaging.sprintpcs.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Don", middle_name: "", last_name: "England", mailing_address_attributes: {street: "9114 Balcones Club Dr", street2: "", city: "Austin", state: "TX", zip: "78750"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512.470.7777"}, {contact_label: "cell", contact_type: "voice", contact_value: "512.470.7777"}, {contact_label: "pager", contact_type: "pager", contact_value: "399-7239"}, {contact_label: "home", contact_type: "email", contact_value: "5124707777@vtext.com; englandd1939@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "englandd1939@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Michael", middle_name: "", last_name: "Fehmer", mailing_address_attributes: {street: "176 Spring Creek  Dr", street2: "", city: "Cedar Creek", state: "TX", zip: "78612"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512.559.0150"}, {contact_label: "cell", contact_type: "voice", contact_value: "512-745-1345"}, {contact_label: "home", contact_type: "email", contact_value: "5127451345@vzwpix.com; michaelfehmer@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "fehmerterp@yahoo.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Shirley", middle_name: "", last_name: "Gerhardt", mailing_address_attributes: {street: "548 Elk Ridge Lane", street2: "", city: "Axtell", state: "TX", zip: "76624"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "515-6597"}, {contact_label: "pager", contact_type: "pager", contact_value: "625-5126"}, {contact_label: "home", contact_type: "email", contact_value: "Shirley.gerhardt@tmo.blackberry.net"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Gina", middle_name: "", last_name: "Gonzalez", mailing_address_attributes: {street: "11505 James B Connolly", street2: "", city: "Austin", state: "TX", zip: "78748"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "535-3115"}, {contact_label: "cell", contact_type: "voice", contact_value: "512 300-3292"}, {contact_label: "home", contact_type: "email", contact_value: "5123003292@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "gglucas71@aol.com"}]
Person.create! type: "Interpreter", gender: "male", first_name: "Rob", middle_name: "", last_name: "Granberry", mailing_address_attributes: {street: "1047 Bosque Ridge", street2: "", city: "Crawford", state: "TX", zip: "76638"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 934-2315"}, {contact_label: "work", contact_type: "voice", contact_value: "(254) 299-8733"}, {contact_label: "home", contact_type: "email", contact_value: "robgranberry@gmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Sharon", middle_name: "", last_name: "Hassell", mailing_address_attributes: {street: "2203 Lindell Ave", street2: "", city: "Austin", state: "TX", zip: "78704"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "912-0538"}, {contact_label: "cell", contact_type: "voice", contact_value: "512.789.1646"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-0070"}, {contact_label: "home", contact_type: "email", contact_value: "Sharonlynn15@sprint.blackberry.net"}, {contact_label: "email2", contact_type: "email", contact_value: "shassell@austin.rr.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Jackie", middle_name: "", last_name: "Hilmers", mailing_address_attributes: {street: "304 Vance", street2: "", city: "Waco", state: "TX", zip: "76705"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "email", contact_value: "2546440670@vtext.com"}, {contact_label: "email2", contact_type: "email", contact_value: "jhilmers@hotmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Ann", middle_name: "", last_name: "Horn (CDI)", mailing_address_attributes: {street: "11425 Midbury Court", street2: "", city: "Austin", state: "TX", zip: "78748"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(512) 233-4502"}, {contact_label: "home", contact_type: "email", contact_value: "annhhorn@tmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Melissa", middle_name: "", last_name: "Kallina", mailing_address_attributes: {street: "11505 James B Connolly", street2: "", city: "Austin", state: "TX", zip: "78748"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "535-3115"}, {contact_label: "cell", contact_type: "voice", contact_value: "300-3292"}, {contact_label: "home", contact_type: "email", contact_value: "mskallina@att.blackberry.net"}, {contact_label: "email2", contact_type: "email", contact_value: "melissakallina@yahoo.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Amanda", middle_name: "", last_name: "Katz", mailing_address_attributes: {street: "4216 Ovalla Cove", street2: "", city: "Austin", state: "TX", zip: "78749"}, virtual_addresses_attributes: [{contact_label: "cell", contact_type: "voice", contact_value: "512-293-2792"}, {contact_label: "home", contact_type: "email", contact_value: "amanda.katz03@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "amanda.katz03@gmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Dannette", middle_name: "", last_name: "Lewis - Ross", mailing_address_attributes: {street: "7934 Wheel Rim Circle", street2: "", city: "Austin", state: "TX", zip: "78749"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "301-3970"}, {contact_label: "work", contact_type: "voice", contact_value: "428-1810"}, {contact_label: "cell", contact_type: "voice", contact_value: "512.417.7643"}, {contact_label: "home", contact_type: "email", contact_value: "5125177643@messaging.sprintpcs.com; dannetteross01@gmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Mindi", middle_name: "", last_name: "McCarty", mailing_address_attributes: {street: "6112 Hylawn", street2: "", city: "Austin", state: "TX", zip: "78723"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512/926-8001"}, {contact_label: "cell", contact_type: "voice", contact_value: "512/739-3464"}, {contact_label: "home", contact_type: "email", contact_value: "5127393464@txt.att.net"}]
Person.create! type: "Interpreter", gender: "male", first_name: "Steven", middle_name: "", last_name: "Miller", mailing_address_attributes: {street: "910 Gene Johnson Street", street2: "", city: "Austin", state: "TX", zip: "78751"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-420-0520"}, {contact_label: "cell", contact_type: "voice", contact_value: "512-917-6407"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-8615"}, {contact_label: "home", contact_type: "email", contact_value: "5129176407@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "sdmiller188@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Teresa", middle_name: "", last_name: "Miller", mailing_address_attributes: {street: "1020 E 45th St", street2: "Apt  147", city: "Austin", state: "TX", zip: "78751"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "420-2266"}, {contact_label: "cell", contact_type: "voice", contact_value: "576-2442"}, {contact_label: "home", contact_type: "email", contact_value: "5125762442@tmomail.net"}, {contact_label: "email2", contact_type: "email", contact_value: "teriterp@yahoo.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Debbie", middle_name: "", last_name: "Munn", mailing_address_attributes: {street: "8810 Tallwood  #83", street2: "", city: "Austin", state: "TX", zip: "78759"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-422-7892"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-0423"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Patsy", middle_name: "", last_name: "Nelson-Farmer", mailing_address_attributes: {street: "2302 Rick Whinery Dr", street2: "", city: "Austin", state: "TX", zip: "78728"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "251-6323"}, {contact_label: "cell", contact_type: "voice", contact_value: "913-0008"}, {contact_label: "home", contact_type: "email", contact_value: "5129130008@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "patsynf@austin.rr.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Alena", middle_name: "", last_name: "Newberry-Scott", mailing_address_attributes: {street: "206 Mardan", street2: "", city: "Buda", state: "TX", zip: "78610"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "312-1813"}, {contact_label: "work", contact_type: "voice", contact_value: "736-3906"}, {contact_label: "cell", contact_type: "voice", contact_value: "736-3906"}, {contact_label: "home", contact_type: "email", contact_value: "alena.newberry@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "alena.newberry@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Bob", middle_name: "", last_name: "Pfaff", mailing_address_attributes: {street: "3404 Great Valley Drive", street2: "", city: "Cedar Park", state: "TX", zip: "78613"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "360-693-8043"}, {contact_label: "home", contact_type: "email", contact_value: "5126591953@txt.att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "bobstarcsi@gmail.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Denise", middle_name: "", last_name: "Pfaff", mailing_address_attributes: {street: "3404 Great Valley Drive", street2: "", city: "Cedar Park", state: "TX", zip: "78613"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512/587-5725"}, {contact_label: "home", contact_type: "email", contact_value: "5125875725@txt.att.net;denisestarcsi@gmail.com;nissi2@att.net"}, {contact_label: "email2", contact_type: "email", contact_value: "denisestarcsi@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Lynette", middle_name: "", last_name: "Pickens-Fant", mailing_address_attributes: {street: "4501 Russell Dr", street2: "", city: "Austin", state: "TX", zip: "78745"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "447-0120"}, {contact_label: "cell", contact_type: "voice", contact_value: "413-0523"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-0748"}, {contact_label: "home", contact_type: "email", contact_value: "lpfant@att.blackberry.net"}, {contact_label: "email2", contact_type: "email", contact_value: "lpfant@austin.rr.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Sharon", middle_name: "", last_name: "Ploeger", mailing_address_attributes: {street: "5806 Pecanwood Lane", street2: "", city: "Austin", state: "TX", zip: "78749"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "301-6858"}, {contact_label: "pager", contact_type: "pager", contact_value: "499-1193"}, {contact_label: "home", contact_type: "email", contact_value: "sploeger@austin.utexas.edu"}, {contact_label: "email2", contact_type: "email", contact_value: "5127739018@vtext.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Kris", middle_name: "", last_name: "Pullin", mailing_address_attributes: {street: "404 Old Bethany Road", street2: "", city: "Bruceville", state: "TX", zip: "76630"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 576-2925"}, {contact_label: "cell", contact_type: "voice", contact_value: "2547232603"}, {contact_label: "home", contact_type: "email", contact_value: "2547232603@mobile.mycingular.com"}, {contact_label: "email2", contact_type: "email", contact_value: "kristerp@live.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Nancy", middle_name: "", last_name: "Riley", mailing_address_attributes: {street: "321 Heartwood Dr.", street2: "", city: "Austin", state: "TX", zip: "78745"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "512-444-5898"}, {contact_label: "cell", contact_type: "voice", contact_value: "512-789-3933"}, {contact_label: "pager", contact_type: "pager", contact_value: "606-5527"}, {contact_label: "home", contact_type: "email", contact_value: "nancyriley20@gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Kimberly", middle_name: "", last_name: "Santascoy", mailing_address_attributes: {street: "209 Hampton Court", street2: "", city: "Victoria", state: "TX", zip: "77904"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "659-6718"}, {contact_label: "cell", contact_type: "voice", contact_value: "797-6521"}, {contact_label: "home", contact_type: "email", contact_value: "pinkboxshop@yahoo.com"}]
Person.create! type: "Interpreter", gender: "male", first_name: "Alan", middle_name: "", last_name: "Sessions", mailing_address_attributes: {street: "8607 Rockwood Lane", street2: "", city: "Austin", state: "TX", zip: "78757"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "707-2094"}, {contact_label: "cell", contact_type: "voice", contact_value: "413-9146"}, {contact_label: "home", contact_type: "email", contact_value: "alsessions@me.com"}, {contact_label: "email2", contact_type: "email", contact_value: "5124139146@mmode.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Jariatou", middle_name: "", last_name: "Sibi", mailing_address_attributes: {street: "5800 Brodie Lane", street2: "Apt 817", city: "Austin", state: "TX", zip: "78745"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(512) 291-9280"}, {contact_label: "cell", contact_type: "voice", contact_value: "5127895742"}, {contact_label: "home", contact_type: "email", contact_value: "jariatousibi@hotmail.com; 5127895742@messaging.sprintpcs.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Barbara", middle_name: "", last_name: "Steinbrenner", mailing_address_attributes: {street: "P.O. Box 381", street2: "", city: "Eddy", state: "TX", zip: "76524"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 859-5791"}, {contact_label: "cell", contact_type: "voice", contact_value: "254-644-0167"}, {contact_label: "home", contact_type: "email", contact_value: "stein1225@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "bjsteinbrenner@sbcglobal.net"}]
Person.create! type: "Interpreter", gender: "", first_name: "Nancy", middle_name: "", last_name: "Thomas", mailing_address_attributes: {street: "1080 PR 7717", street2: "", city: "Lexington", state: "TX", zip: "78947"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "979-773-3011"}, {contact_label: "work", contact_type: "voice", contact_value: "606-3315"}, {contact_label: "cell", contact_type: "voice", contact_value: "979-540-7585"}, {contact_label: "home", contact_type: "email", contact_value: "NancyLeann@mac.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Cathy", middle_name: "", last_name: "Thornton", mailing_address_attributes: {street: "1005 S. 20th St", street2: "", city: "Waco", state: "TX", zip: "76706"}, virtual_addresses_attributes: [{contact_label: "cell", contact_type: "voice", contact_value: "254.652.7340"}, {contact_label: "home", contact_type: "email", contact_value: "cathythornton55@yahoo.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Audrey", middle_name: "W.", last_name: "Ulloa", mailing_address_attributes: {street: "2902 Dancy St.", street2: "", city: "Austin", state: "TX", zip: "78722"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "236-1263"}, {contact_label: "home", contact_type: "email", contact_value: "awulloa@yahoo.com"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Polly", middle_name: "", last_name: "Ware", mailing_address_attributes: {street: "2931 Mazanec Rd.", street2: "", city: "Waco", state: "TX", zip: "76705"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 799-4769"}, {contact_label: "cell", contact_type: "voice", contact_value: "254.855.9103"}, {contact_label: "home", contact_type: "email", contact_value: "phware1@yahoo.com"}, {contact_label: "email2", contact_type: "email", contact_value: "2548559103@txt.att.net"}]
Person.create! type: "Interpreter", gender: "", first_name: "Shawn", middle_name: "", last_name: "Whitley", mailing_address_attributes: {street: "147 Avenida Tejas", street2: "", city: "Kyle", state: "TX", zip: "78640"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "785-5743"}, {contact_label: "home", contact_type: "email", contact_value: "swhitley21@Gmail.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Cathy", middle_name: "", last_name: "Williams", mailing_address_attributes: {street: "2413 Roehampton", street2: "", city: "Austin", state: "TX", zip: "78745"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "445-0483"}, {contact_label: "work", contact_type: "voice", contact_value: "462-5452"}, {contact_label: "cell", contact_type: "voice", contact_value: "848-2481"}, {contact_label: "home", contact_type: "email", contact_value: "cathywilliams@nextel.blackberry.net"}, {contact_label: "email2", contact_type: "email", contact_value: "cathy.williams@tsd.state.tx.us"}]
Person.create! type: "Interpreter", gender: "", first_name: "Lori", middle_name: "", last_name: "Wrzesinski", mailing_address_attributes: {street: "617 Retama Park", street2: "", city: "Robinson", state: "TX", zip: "76706"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 662-9244"}, {contact_label: "work", contact_type: "voice", contact_value: "254/710-6367"}, {contact_label: "cell", contact_type: "voice", contact_value: "254/366-2280"}, {contact_label: "home", contact_type: "email", contact_value: "lori_wrzesinski@baylor.edu"}]
Person.create! type: "Interpreter", gender: "female", first_name: "Beverly", middle_name: "", last_name: "Young", mailing_address_attributes: {street: "12512 Belcara Place", street2: "", city: "Austin", state: "TX", zip: "78732"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "266-9826"}, {contact_label: "cell", contact_type: "voice", contact_value: "663-6328"}, {contact_label: "home", contact_type: "email", contact_value: "beverlyyoung23@gmail.com"}, {contact_label: "email2", contact_type: "email", contact_value: "beverlyyoung23@yahoo.com"}]
Person.create! type: "Interpreter", gender: "", first_name: "Deborah", middle_name: "", last_name: "Zembo", mailing_address_attributes: {street: "532 Chatham", street2: "", city: "Belton", state: "TX", zip: "76513"}, virtual_addresses_attributes: [{contact_label: "home", contact_type: "voice", contact_value: "(254) 780-4940"}, {contact_label: "work", contact_type: "voice", contact_value: "(254)710-4746"}, {contact_label: "cell", contact_type: "voice", contact_value: "(254)913-5209"}, {contact_label: "home", contact_type: "email", contact_value: "deborah_zembo@baylor.edu"}]

InterpreterCertification.create! certification: c1, interpreter: i1, certifier: "Instituion1", comment: "", start_date: (DateTime.now - 6.months), end_date: (DateTime.now + 6.months)
InterpreterCertification.create! certification: c2, interpreter: i1, certifier: "Instituion2", comment: "", start_date: (DateTime.now - 6.months), end_date: (DateTime.now + 6.months)
InterpreterCertification.create! certification: c3, interpreter: i1, certifier: "Instituion3", comment: "", start_date: (DateTime.now - 6.months), end_date: (DateTime.now + 6.months)


# Going to set all the interpreters to 5 miles
Interpreter.all.each { |i| i.miles_willing_to_travel = 5; i.save! }

# Giving all interpreters a pricing plan
Interpreter.all.each do |i|
  i.build_pricing_plan if i.pricing_plan.nil?
  if i.pricing_plan.pricing_rates.empty?
    availability = SimpleAvailability.new :start_day => :monday, :end_day => :friday, :start_time => 8.hours, :end_time => 17.hours
    i.pricing_plan.pricing_rates = availability.to_pricing_rates.each { |r| r.hourly_rate = 2000; r.effective_date = DateTime.new(2012); }
    i.save!
  end
end

puts '--- Interpreters created'

# Monkeypatch JobOffer for seeding ids
JobOffer
class JobOffer
  attr_accessible :interpreter_id, :job_request_id
end

puts '--- Creating job_offers and job_assignments'
client1.job_requests.each do |jr|
  stat1 = 'pending'
  stat2 = 'pending'
  if (jr.start_datetime < DateTime.current)
    stat1 = 'accepted'
    stat2 = 'completed'
  else
    if (rand() < 0.3)
      stat1 = 'accepted'
    end
  end
  jo = JobOffer.create! status: stat1, interpreter_id: i1.id, job_request_id: jr.id
  if (stat1 != 'pending')
    ja = JobAssignment.create! status: stat2, scheduled_start: jr.start_datetime, estimated_end: jr.start_datetime + jr.estimated_period, actual_start: jr.start_datetime, actual_end: jr.start_datetime + jr.estimated_period, client_id: client1.id, interpreter_id: i1.id, job_request_id: jr.id, client_invoice_id: '', interpreter_invoice_id: ''
  end
end

i1.save!
client1.save!

puts "DB DATA IMPORT SUCCESSFUL"
