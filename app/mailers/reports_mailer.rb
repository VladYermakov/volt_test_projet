class ReportsMailer < ApplicationMailer
  def mail_report(email, body, start_date, end_date)
    @body = body
    @start_date = start_date
    @end_date = end_date
    mail to: email, subject: 'sample'
  end
end
