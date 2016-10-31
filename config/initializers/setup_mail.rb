ActionMailer::Base.smtp_settings = {
  address:        'smtp.sendgrid.com',
  port:           '587',
  domain:         ENV['domain'],
  authentication: :plain,
  user_name:      ENV['username'],
  password:       ENV['password'],
  ssl:            true
}