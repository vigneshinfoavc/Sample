module Dion
  class MFObjectives
    include Dion::Base

    KEYS = [ :security_code ]
    MODEL = DataProvider::Scheme

  private
    def self.translate_fields(args)
      [ :modify_on, :delete_flag ].each { |key| args.delete(key) }    #delete not required fields
			args[:security_code] = args.delete(:securitycode)
      args
    end
  end
end
