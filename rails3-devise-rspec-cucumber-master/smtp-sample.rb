require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <raychorn@gmail.com>
To: A Test User <test@vyperlogix.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('smtp.mailgun.org', 25, 'vyperlogix.com', 'postmaster@vyperlogix.com', '5gqe8q71c2g9', :plain) do |smtp|
  smtp.send_message message, 'raychorn@gmail.com', 
                             'test@vyperlogix.com'
end
