module ApplicationHelper
  def mailer_logger
    MailerLogger.new.logger
  end
end
