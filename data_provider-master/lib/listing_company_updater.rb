require 'csv'

require_relative 'data_provider'

class ListingCompanyUpdater
  SOURCE = ['NseTopListingCompany', 'BseTopListingCompany', 'SandPCNXNiftyCompany']
  def self.update_records
    SOURCE.each do |model_name|
      "DataProvider::#{model_name}".constantize.send(:all).each {|company| company.destroy}
      CSV.foreach(File.expand_path("../../doc/#{model_name}.csv", __FILE__)) do |row|
        "DataProvider::#{model_name}".constantize.send(:find_or_initialize_by_id, row[0]).save
      end
    end
  end
end
