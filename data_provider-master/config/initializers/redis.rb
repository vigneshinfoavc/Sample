require "logger"
$stdout.sync = true
LOGGER=Logger.new($stdout)
require 'redis' unless defined? Redis
begin
  redis = YAML.load(ERB.new(File.read(File.join(File.dirname(__FILE__),"../redis.yml"))).result)[Rails.env]
  REDIS ||= Redis.new(redis.symbolize_keys)
rescue => e
  LOGGER.error "#{e.class.name}: #{e.message}"
  LOGGER.warn  "couldn't load redis, this could be common in precompilation stage"
end
