namespace :data_provider do
  namespace :scrips do
    desc "This task scrip stock data and runs every 1 min"
    task :update do
      require File.expand_path('../../scrip_updater.rb', __FILE__)
      ScripUpdater.update_records(:market => :nse)
      ScripUpdater.update_records(:market => :bse)
      ScripUpdater.update_records(:market => :nse_indices)
    end

    desc "Enable the data provider for scrips"
    task :enable do
      require File.expand_path('../../scrip_updater.rb', __FILE__)
      ScripUpdater.reset_close_price
      ScripUpdater.enable
    end

    desc "Update indices master once"
    task :indices_master do
      require File.expand_path('../../scrip_updater.rb', __FILE__)
      ScripUpdater.update_records(:market => :indices_master)
    end

    desc "Disable the data provider for scrips"
    task :disable do
      require File.expand_path('../../scrip_updater.rb', __FILE__)
      ScripUpdater.disable
    end
  end
end
