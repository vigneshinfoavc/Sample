require 'logger'
$stdout.sync = true
LOGGER=Logger.new($stdout)
LOGGER.level = "Logger::Severity::#{ENV['LOG_LEVEL']}".constantize if ENV['LOG_LEVEL']
