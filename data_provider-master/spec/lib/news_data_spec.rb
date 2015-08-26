require 'spec_helper'
require 'news_data'

describe NewsData, :vcr do

  it "should parse feeds from rssfeeds from economic times 5304040" do
    NewsData.fetch_and_parse('http://economictimes.feedsportal.com/c/33041/f/534040/index.rss','EconomicTimes', 'ipos')
    (article = DataProvider::NewsArticle.where(:title => 'Speciality Restaurants fixes IPO price band at Rs 146-155').first).should_not be_nil
    article.summary.should include 'Fine dine operator Speciality Restaurants fixed the price band at Rs 146-155 for its initial public offering (IPO)'
    article.summary.should_not include("div", "img", "href")
    article.url.should eq "http://economictimes.feedsportal.com/fy/8av2EvY0ZbXKa2NA/story01.htm"
  end
end
