require 'net/ftp'
require 'pry'
require 'csv'
require 'date'
require 'nokogiri'

require_relative 'data_provider'

class ScripUpdater
  DATA_SOURCES = {
    :nse => {
      :url       => "ftpservice.acesphere.com",
      :username  => "investo",
      :password  => "Inv$29Mar13P",
      :directory => "stocks/intraday/nse"
    },
    :bse => {
      :url       => "ftpservice.acesphere.com",
      :username  => "investo",
      :password  => "Inv$29Mar13P",
      :directory => "stocks/intraday/bse"
    },
    :indices_master => {
      :url       => "ftpservice.acesphere.com",
      :username  => "investo",
      :password  => "Inv$29Mar13P",
      :directory => "stocks"
    },
    :bse_indices => {
      :url       => "ftpservice.acesphere.com",
      :username  => "investo",
      :password  => "Inv$29Mar13P",
      :directory => "stocks/intraday/indices/bse"
    },
    :nse_indices => {
      :url       => "ftpservice.acesphere.com",
      :username  => "investo",
      :password  => "Inv$29Mar13P",
      :directory => "stocks/intraday/indices/nse"
    }
  }

  DATA_ATTRIBUTES = {
    :nse => {
      :id                => 1,
      :time              => 18,
      :last_traded_price => 3,
      :volume            => 8,
      :open_price        => 10,
      :high_price        => 11,
      :low_price         => 12,
      :close_price       => 13,
      :net_change        => 16,
      :percent_change    => 17
    },
    :bse => {
      :id                => 0,
      :time              => 11,
      :last_traded_price => 2,
      :high_price        => 3,
      :low_price         => 4,
      :open_price        => 1,
      :volume            => 9
    },
    :bse_indices => {
      :time        => 7,
      :high_price  => 2,
      :low_price   => 3,
      :open_price  => 1,
      :volume      => 5,
      :token_id    => 0
    },
    :indices_master => {
      :id              => 0,
      :exchange        => 1,
      :index_name      => 2,
      :index_long_name => 3
    },
    :nse_indices => {
      :id             => 1,
      :time           => 10,
      :high_price     => 3,
      :low_price      => 4,
      :open_price     => 7,
      :volume         => 5,
      :net_change     => 8,
      :percent_change => 9,
      :close_price    => 2
    }
  }

  DATA_MODEL = {
    :bse => DataProvider::BseScrip,
    :nse => DataProvider::NseScrip,
    :indices_master => DataProvider::IndicesMaster,
    :nse_indices => DataProvider::NseScrip,
    :bse_indices => DataProvider::BseScrip
  }

  ALLOWED_SERIES = ['BE', 'DR', 'EQ', '']

  def self.enable
    REDIS.set 'ScripData:enabled', true
  end

  def self.disable
    REDIS.del 'ScripData:enabled'
  end

  def self.update_records(opts = {:market => 'nse'})
    return unless opts.delete(:force) || REDIS.get('ScripData:enabled')
    records = self.fetch_data(opts[:market])
    records.each do |attributes|
      #next if (series = attributes.delete(:series)) && !(ALLOWED_SERIES.include? series)
      item = nil
      begin
        if opts[:market] == :bse
          if (1..27).include?(attributes[:id].to_i)
            index_name = DataProvider::IndicesMaster.find(attributes[:id]) && DataProvider::IndicesMaster.find(attributes.delete(:id)).index_name
            item = DATA_MODEL[opts[:market]].find_or_initialize_by_id(index_name) if index_name
          else
            item = DATA_MODEL[opts[:market]].find_or_initialize_by_id attributes.delete :id
          end
          if (update_close_price?) || !item.valid_close_price?
            attributes[:close_price] = item.last_traded_price
          end
        else
          item = DATA_MODEL[opts[:market]].find_or_initialize_by_id attributes.delete :id
          attributes[:last_traded_price] = attributes[:open_price].to_i + attributes[:net_change].to_i if opts[:market] == :nse_indices
        end
        attributes.delete(:time) if market_closed? # check bse time record
        item.update_attributes(attributes) if item
      rescue => e
        puts "======#{attributes[:id]}========="
        puts e
      end
    end
    reset_close_price if !records.empty? && update_close_price? && opts[:market] == :bse
  end

  def self.fetch_data(index)
    data = []
    Net::FTP.open(DATA_SOURCES[index][:url], DATA_SOURCES[index][:username], DATA_SOURCES[index][:password]) do |ftp|
      ftp.passive = true
      ftp.chdir DATA_SOURCES[index][:directory] if DATA_SOURCES[index][:directory]
      if index == :indices_master
        file_name = 'indicesmaster.ace'
      else
        ftp.chdir Date.today.strftime('%d%m%Y')
        file_name = ftp.nlst.select{|f| f unless f.include?('Indices_') || f.include?('.xml')}
        return data unless file_name = file_name.sort_by { |f| ftp.mtime f }.last
      end

      if file_name.include?('.ace')
        puts "--#{file_name}--processing #{index}----"
        ftp.gettextfile(file_name, nil) do |line|
          if line.include?('<<row>>')
            filtered_data = line.gsub(/<<\/?row>>/, '')
            data << attributes_hash(CSV.parse_line(filtered_data, { :col_sep => "|"  }), index)
          end
        end
        puts "----end process #{index}----"
      end
    end

    data
  end

private

  # Typecasts an Object to a DateTime
  # Override the default for DION
  #
  def self.with_modified_datecaster
    ActiveAttr::Typecasting::DateTimeTypecaster.class_eval do
      alias :old_call :call
      def call(value)
        DateTime.strptime value, "%m/%e/%Y %r"
      end
    end

    yield

    ActiveAttr::Typecasting::DateTimeTypecaster.class_eval do
      alias :call :old_call
    end
  end

  def self.reset_close_price
    if update_close_price?
      REDIS.del 'ScripData:ClosePrice:Update'
    else
      REDIS.set 'ScripData:ClosePrice:Update', true
    end
  end

  def self.update_close_price?
    REDIS.get('ScripData:ClosePrice:Update')
  end

  def self.market_closed?
    @time = Time.now
    (16..19).include?(@time.hour)
  end

  def self.attributes_hash_name(row, index)
    data = DATA_ATTRIBUTES_NAME[index].map { |key, value|
      [key, row.xpath(".//#{value}").first.children.text.strip] unless row.xpath(".//#{value}").empty?
    }.compact
    Hash[ data ]
  end

  def self.attributes_hash(row, index)
    Hash[ DATA_ATTRIBUTES[index].map { |key, value| [key, row[value].strip] if row[value] } ]
  end
end
