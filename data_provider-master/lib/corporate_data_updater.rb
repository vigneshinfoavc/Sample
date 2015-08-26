require 'pinch'
require 'nokogiri'

require 'dion'
require 'corporate_data_updater/helpers'

Dir[File.expand_path("../../config/initializers/**/*.rb", __FILE__)].each {|f| require f}

class CorporateDataUpdater
  autoload :FileNames, 'corporate_data_updater/file_names'

  attr_accessor :file_list, :url

  DATA_URL = 'http://download.dionglobal.in/portals/'
  #DUMP_URL = 'http://173.255.201.177/data_provider_dump'
  DUMP_URL = 'http://115.111.221.18/ir/Invest/'  

  def self.seed
    CorporateDataUpdater::FileNames.each do |f|
      url = "#{DUMP_URL}/#{File.basename(f, '.xml')}.zip"
      CorporateDataUpdater.update_data :force => true, :url => url
    end
  end

  def self.incremental_seed(year, month, date)
    (DateTime.new(year, month, date, 23, 20)..DateTime.now).each do |time|
      CorporateDataUpdater.update_data :force => true,
                                           :time => time
    end
  end

  def self.enable
    REDIS.set 'CorporateData:enabled', true
  end

  def self.disable
    REDIS.del 'CorporateData:enabled'
  end

  def self.flush
    Mongoid.purge!
  end

  def self.update_data(opts = {})
    return unless opts.delete(:force) || REDIS.get('CorporateData:enabled')
    parser = new(opts)
    STATSD.time("timing.update_data.#{parser.url}") do
      parser.run
    end
    parser
  end

  def initialize(opts={})
    @time = opts[:time] || Time.now
    @url = opts[:url] || "#{DATA_URL}XI#{@time.strftime('%d%m%Y')}#{type}.zip"
    @file_list = []
    begin
      @remote_archive = Pinch.new(@url)
      @file_list = @remote_archive.file_list & FileNames
    rescue Exception => e
      LOGGER.error "#{e.class.name}: #{e.message}"
      e.backtrace.each {|l| LOGGER.warn l }
      STATSD.increment "error.initialize.#{@url}"
    end
  end

  def run
    @file_list.each do |file|
      begin
        parse_and_update file
      rescue Exception => e
        LOGGER.error "#{e.class.name}: #{e.message}"
        e.backtrace.each {|l| LOGGER.warn l }
        STATSD.increment "error.run.#{file}"
      end
    end
  end

  def parse_and_update(file_name)
    @remote_archive.get(file_name) do |response|
      response.stream do |io|
        begin
          STATSD.time("timing.parse_and_update.#{file_name}") do
            parse_and_update_record_from(file_name, io)
          end
        rescue Exception => e
          LOGGER.error "#{e.class.name}: #{e.message}"
          e.backtrace.each {|l| LOGGER.warn l }
          STATSD.increment "error.parse_and_update.#{file_name}"
        end
      end
    end
  end

  ##
  # {
  #   "AccountingPolicy" => {
  #     "Item" => [<Hashes of records>]
  #   }
  # }
  #
  def parse_and_update_record_from(file_name, io_or_string)
    model = "Dion::#{File.basename(file_name, ".xml")}".constantize
    reader = Nokogiri::XML::Reader(io_or_string)
    reader.each do |node|
      if node.name == "Item" && node.inner_xml
        record = Hash.from_xml(node.outer_xml)["Item"]
        if record
          record.underscore_keys!.symbolize_keys!
          STATSD.time("timing.find_and_update.#{model.name}") do
            model.find_and_update_attributes record
          end
          STATSD.increment "records.#{model.name}"
        end
      end
    end
  end

  def type
    @type ||= case @time.hour
    when 0..6
      "01"
    when 7..17
      "02"
    else
      "04"
    end
  end

end
