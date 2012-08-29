ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "uas.physics.ucla.edu",
  :user_name => "uas.ucla",
  :password => "##### DO NOT COMMIT #####",
  :authentication => "plain",
  :enable_starttls_auto => true
}