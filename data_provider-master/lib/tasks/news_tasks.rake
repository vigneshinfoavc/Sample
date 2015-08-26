namespace :data_provider do
  namespace :news do
    desc "This task fetch news data and runs every 10 min"
    task :update do
      require File.expand_path('../../news_data.rb', __FILE__)
      NewsData.store_feeds
    end
  end
end
