module Dion
  class NAVCategoryDetails
    include Dion::Base

    KEYS = [ :scheme_class_code ]
    MODEL = DataProvider::NetAssetValueCategory
  end
end
