module Dion
  class News
    include Dion::Base

    KEYS = [ :company_code, :news_date, :headlines ]
    MODEL = DataProvider::News
  end
end
