ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :user_name      => 'a9bb3ca5950f8b',
  :password       => 'b93ddddcf60351',
  :address        => 'mailtrap.io',
  :domain         => 'mailtrap.io',
  :port           => '2525',
  :authentication => :cram_md5
}