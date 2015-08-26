require 'redis_record'

module DataProvider
	class NseTopListingCompany < RedisRecord
		string    :id    #nse_code
  end
end
