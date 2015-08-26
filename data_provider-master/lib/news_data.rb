require 'feedzirra'
require 'net/http'
require_relative 'data_provider'

class NewsData

  FEEDS = [
    { :name => 'Business Standard',   :section => 'markets',           :url => 'http://feeds.business-standard.com/rss/1_0.xml'                 },
    { :name => 'Business Standard',   :section => 'economy',           :url => 'http://feeds.business-standard.com/rss/4_0.xml'                 },
    { :name => 'Financial Express',   :section => 'companies',         :url => 'http://syndication.financialexpress.com/rss/95/companies.xml'   },
    { :name => 'Financial Express',   :section => 'global_news',       :url => 'http://syndication.financialexpress.com/rss/98/world-news.xml'  },
    { :name => 'Money Control',       :section => 'stock_tips',        :url => 'http://www.moneycontrol.com/rss/brokeragerecos.xml'             }
  ]

  def self.store_feeds
    FEEDS.each do |feed|
      self.fetch_and_parse(feed[:url],feed[:name],feed[:section])
    end
  end

  def self.fetch_and_parse(url, name, section)
    response = Net::HTTP.get_response URI(url)
    feed_content = Feedzirra::Feed.parse response.body
    feed_content && feed_content.entries.each do |entry|
    DataProvider::NewsArticle.find_or_initialize_by(url: entry.url).
      update_attributes( :title        => Loofah.fragment(entry.title).to_text,
                         :summary      => Loofah.fragment(entry.summary).to_text,
                         :published    => entry.published,
                         :source       => name,
                         :section_name => section )
    end
  end

end
