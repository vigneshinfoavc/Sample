require 'statsd'

require_relative 'logger'
Statsd.logger = LOGGER

STATSD = Statsd.new ENV['STATSD_SERVER'], (ENV['STATSD_PORT'] || 8125).to_i
