module Dion
  class ListingMaster
    include Dion::Base

    KEYS = [ :security_code, :exchange_code ]
    MODEL = DataProvider::Listing
  end
end
