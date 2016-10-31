ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => ENV['domain'],
  :authentication       => :plain,
  :user_name            => ENV['username'],
  :password             => ENV['password'],
  :enable_starttls_auto => true
}