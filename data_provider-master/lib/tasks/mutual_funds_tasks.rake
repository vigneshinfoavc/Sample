namespace :data_provider do
  namespace :mutual_funds do
    desc "Dump the initial files, run incremental updates since <days> ago and start regular sync"
    task :seed, [:year, :month, :date] do |t, args|
      CorporateDataUpdater.disable
      CorporateDataUpdater.flush
      CorporateDataUpdater.seed

      Rake::Task[:incremental_seed].invoke args[:year], args[:month], args[:date]

      CorporateDataUpdater.enable
    end

    task :incremental_seed, [:year, :month, :date] do |t, args|
      CorporateDataUpdater.incremental_seed args[:year].to_i, args[:month].to_i, args[:date].to_i
    end

    desc "This task is for Corporate & Mutual fund Data and runs three times a day at 9.30 am, 1 pm, 11 pm"
    task :update do
      CorporateDataUpdater.update_data
    end
  end
end
