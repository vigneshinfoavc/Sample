$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "data_provider"
  s.version     = DataProvider::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DataProvider."
  s.description = "TODO: Description of DataProvider."

  s.files = Dir["{config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'active_attr'
  s.add_dependency 'clockwork'
  s.add_dependency 'feedzirra'
  s.add_dependency 'mongoid', '2.4.12'
    s.add_dependency 'bson_ext'
  s.add_dependency 'mongoid_search'
  s.add_dependency 'mongoid_slug'
  s.add_dependency 'money'
  s.add_dependency 'nokogiri'
  s.add_dependency 'pinch'
  s.add_dependency 'redis'
  s.add_dependency 'statsd-ruby'

  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'vcr'
    s.add_development_dependency 'webmock'
end
