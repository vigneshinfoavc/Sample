class DataProvider::NewsArticle
  include Mongoid::Document

  field :title
  field :url
  field :summary
  field :section_name
  field :source
  field :published, :type => DateTime

  def self.feeds
    all
      .sort_by(&:published).reverse
      .group_by(&:section_name)
  end
end
