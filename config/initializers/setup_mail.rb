ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'mail.google.com',
  :authentication       => :plain,
  :user_name            => ENV['username'],
  :password             => ENV['password']
}