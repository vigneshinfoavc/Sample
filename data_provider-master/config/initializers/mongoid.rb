require 'mongoid' unless defined? Mongoid
ENV['RACK_ENV'] ||= 'development'

require_relative 'logger'
Mongoid.logger && Mongoid.logger.level = LOGGER.level

begin
  Mongoid.load!(File.expand_path('../../mongoid.yml', __FILE__))
rescue => e
  LOGGER.error "#{e.class.name}: #{e.message}"
  LOGGER.warn "couldn't load mongoid, this could be common in precompilation stage"
end
