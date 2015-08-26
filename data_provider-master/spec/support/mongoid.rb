Mongoid.logger.level = :warn

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.after(:each) do
    Mongoid.purge!
  end
end
