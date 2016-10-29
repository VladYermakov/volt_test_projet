ActionMailer::Base.smtp_settings = {
  address:        'smtp.gmail.com',
  port:           '465',
  domain:         'localhost:3000',
  authentication: :plain,
  user_name:      'yermakov.v.o@gmail.com',
  password:       '80978822803',
  ssl:            true
}