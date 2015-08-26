require 'corporate_data_updater'

namespace :data_provider do
  namespace :corporate_data do
    desc "Dump the initial files, run incremental updates since <days> ago and start regular sync"
    task :seed, [:year, :month, :date] do |t, args|
      CorporateDataUpdater.disable
      CorporateDataUpdater.seed
      CorporateDataUpdater.incremental_seed args[:year].to_i, args[:month].to_i, args[:date].to_i
      CorporateDataUpdater.enable
    end

    desc "!!! purge the existing corporate data from database: Use EXTREME CAUTION. !!!"
    task :purge do
      CorporateDataUpdater.flush
    end

    desc "to enable market data update"
    task :enable do
      CorporateDataUpdater.enable
    end

    desc "This task is for Corporate & Mutual fund Data and runs three times a day at 9.30 am, 1 pm, 11 pm"
    task :update do
      CorporateDataUpdater.update_data
    end
  end
end
