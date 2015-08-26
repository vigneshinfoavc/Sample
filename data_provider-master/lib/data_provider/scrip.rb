module DataProvider::Scrip
  extend ActiveSupport::Concern

  module ClassMethods
    BATCH_SIZE = 10

    def top_gainers(count)
      top_list(:min => '0', :max => '+inf', :column_name => :percent_change, :count => count, :reverse => true)
    end

    def top_losers(count)
      top_list(:min => '-inf', :max => '0', :column_name => :percent_change, :count => count)
    end

    def most_active(count)
      top_list(:min => '0', :max => '+inf', :column_name => :volume, :count => count, :reverse => true)
    end

    def sectoral_indices(indices_type=nil)
      indices = "#{self}::#{indices_type}".constantize
      indices.map{ |id| find(id) }.compact if indices
    end

  private
    def top_list(options={})
      count = options[:count].to_i

      company_list = []
      company_ids = send("find_ids_by_#{options[:column_name]}", options[:min], options[:max])
      options[:reverse] ? company_ids.reverse! : company_ids

      company_ids.each do |id|
        company_list << find(id) if self::TOP_500_COMPANY_LIST.include?(id)
        break if company_list.count == count
      end

      company_list
    end
  end

  def valid_close_price?
    close_price && close_price != 0 && close_price != ''
  end

end
