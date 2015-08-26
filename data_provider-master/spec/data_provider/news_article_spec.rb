require 'spec_helper'

describe DataProvider::NewsArticle do
  it "saves a record" do
    DataProvider::NewsArticle.find_or_initialize_by(url: "http://economictimes.feedsportal.com/fy/8av2EvY0ZbXKa2NA/story01.htm").
    update_attributes(:title => 'Speciality Restaurants fixes IPO price band at Rs 146-155').should be_true
  end

  it "should give all latest feeds" do
    ipo_articles, world_news_articles = [], []
    5.times { |i|  create :'data_provider/news_article', :published => DateTime.now - i, :section_name => 'ipos' }
    6.times { |i|  create :'data_provider/news_article', :published => DateTime.now - i, :section_name => 'world news' }
    DataProvider::NewsArticle.feeds["ipos"].count.should eq 5
    DataProvider::NewsArticle.feeds["world news"].count.should eq 6
    DataProvider::NewsArticle.feeds["ipos"].first.should be_instance_of(DataProvider::NewsArticle)

  end
end
