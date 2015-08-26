namespace :data_provider do
  namespace :top_listing_company do
    desc "update nse top listing company"

    task :update do
      require File.expand_path('../../listing_company_updater.rb', __FILE__)
      ListingCompanyUpdater.update_records
    end

  end

  namespace :company_indicies do
    desc "Update nse, bse indicies sector in company table"

    task :update do
      require File.expand_path('../../sectoral_indices_company_update.rb', __FILE__)
      SectoralIndicesCompanyUpdate.update_records
    end
  end
end
