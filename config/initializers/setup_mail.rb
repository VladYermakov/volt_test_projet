ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => 'smtp.mailgun.org',
  :port                 => 587,
  :domain               => 'app400f24dcf9d84429b8dccf28cc767a93.mailgun.org',
  :authentication       => :plain,
  :user_name            => 'postmaster@app400f24dcf9d84429b8dccf28cc767a93.mailgun.org',
  :password             => 'ef2bd8c057c76ed645d7103c9ed4b5a3',
  :enable_starttls_auto => true
}