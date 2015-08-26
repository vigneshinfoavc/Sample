require 'redis_record'

module DataProvider
	class SandPCNXNiftyCompany < RedisRecord
	  string    :id    #nse_code

    def nse_scrip
      NseScrip.find(id)
    end
  end
end
