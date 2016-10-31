ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com',
  port:           '465',
  domain:         ENV['domain'],
  authentication: :plain,
  user_name:      ENV['username'],
  password:       ENV['password'],
  ssl:            true
}