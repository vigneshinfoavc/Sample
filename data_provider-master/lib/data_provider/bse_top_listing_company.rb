require 'redis_record'

module DataProvider
	class BseTopListingCompany < RedisRecord
		string    :id   # ticker_name
  end
end
