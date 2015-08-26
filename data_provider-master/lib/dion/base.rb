module Dion
  module Base
    extend ActiveSupport::Concern

    module ClassMethods
      def find_and_update_attributes(attributes)
        attributes = translate_fields(attributes)
        keys = attributes.extract! *self::KEYS
        find_or_initialize_by(keys).update_attributes(attributes)
      end

    private
      def find_or_initialize_by(*args)
        self.new.tap { |p| p.instance_object = self::MODEL.find_or_initialize_by(*args) }
      end

      def translate_fields(args)
        args
      end
    end

    def update_attributes(args)
      instance_object.update_attributes(args)
    end

    included do
      attr_accessor :instance_object
    end
  end
end
