require 'redis_record'

module DataProvider
	class IndicesMaster < RedisRecord

		string    :id    #accord indices index code
		string    :exchange, :index_name, :index_long_name

	end
end
