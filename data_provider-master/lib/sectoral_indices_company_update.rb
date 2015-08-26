require 'csv'
require 'pry'

require_relative 'data_provider'

class SectoralIndicesCompanyUpdate
  SOURCE = ['Nse', 'Bse']
  INDICIES = ['BROAD', 'SECTORAL', 'VOLATILITY_INDEX']

  def self.update_records
    SOURCE.each do |model_name|
      INDICIES.each do |sectoral_index|
        "DataProvider::#{model_name}Scrip::#{sectoral_index}".constantize.each do |index|
          file_name = File.expand_path("../../doc/#{model_name.downcase}/#{index}.csv", __FILE__)
          if File.exist?(file_name)
            CSV.foreach(file_name) do |row|
              company = "DataProvider::#{model_name}Scrip".constantize.send(:find, row[1]).try(:company)
              if company
                company.send("#{model_name.downcase}_indices=", index)
                company.save
              end
            end
          end
        end
      end
    end
  end

end
