class MailerLogger

  attr_accessor :logger

  def initialize
    @logger = Logger.new('log/user_mailer.log')
    @logger.formatter = proc do |severity, datetime, progname, msg|
      "#{severity} #{datetime}: #{msg}\n"
    end
  end

end
