require 'clockwork'
require File.expand_path('../scrip_updater.rb', __FILE__)

include Clockwork

every 1.minute, 'nse scrip' do
  LOGGER.info "running nse scrip"
  ScripUpdater.update_records(:market => :nse)
end

every 1.minute, 'bse scrip' do
  LOGGER.info "running bse scrip"
  ScripUpdater.update_records(:market => :bse)
end

every 5.minute, 'nse indices scrip' do
  LOGGER.info "running nse indices scrip"
  ScripUpdater.update_records(:market => :nse_indices)
end
