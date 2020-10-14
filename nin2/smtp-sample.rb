require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <raychorn@gmail.com>
To: A Test User <test@vyperlogix.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

ARGV.each do|a|
  puts "Argument: #{a}"
end

args = ARGV.each.map.with_index {|w,i| "#{i}:#{w}" }
#puts args.inspect
puts "Argument 1: #{args[0]}"
puts "Argument 2: #{args[1]}"
puts "Argument 3: #{args[2]}"

if args[0] == 'mailgun'
  Net::SMTP.start('smtp.mailgun.org', 25, 'vyperlogix.com', 'postmaster@vyperlogix.com', '5gqe8q71c2g9', :plain) do |smtp|
    smtp.send_message message, 'raychorn@gmail.com',
                      'test@vyperlogix.com'
  end
elsif args[0] == 'other'
  Net::SMTP.start("smtp.gmail.com", 587, "example.com", 'postmaster@vyperlogix.com', '5gqe8q71c2g9', :plain) do |smtp|
    smtp.send_message message, 'raychorn@gmail.com',
                      'test@vyperlogix.com'
  end
else
  puts 'Unknown option(s) given...'
end
