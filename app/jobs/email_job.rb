class EmailJob < ApplicationJob
  queue_as :default

  def perform(email, body, start_date, end_date)
    ReportsMailer.mail_report(email, body, start_date, end_date).deliver_later
  end
end
