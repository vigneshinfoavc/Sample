# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RACK_ENV"] ||= 'test'

require 'factory_girl'
require 'rspec/autorun'
require 'shoulda-matchers'
require 'pry'

require 'data_provider'
require 'dion'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.expand_path("../support/**/*.rb", __FILE__)].each {|f| require f}

RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  FactoryGirl.find_definitions
  config.include FactoryGirl::Syntax::Methods
end
