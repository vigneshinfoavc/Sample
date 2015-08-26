FactoryGirl.define do
  factory :'data_provider/news_article' do
    sequence(:url, Time.now.to_i) { |n| "http://myportal.com/#{n}/story01.htm" }
    sequence(:title, Time.now.to_i) { |n| "Title #{n}" }
    sequence(:summary, Time.now.to_i) { |n| "Summary #{n}" }
    published DateTime.now
  end
end
