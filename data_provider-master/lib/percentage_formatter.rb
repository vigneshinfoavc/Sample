require 'percentage'

module PercentageFormatter
  extend ActiveSupport::Concern

  module ClassMethods
    def percentize(*columns)
      columns.each do |column_name|
        define_method column_name do
          value = self.instance_variable_get(:@attributes)[column_name.to_s]
          value = Percentage.new(value.to_s) unless value.blank?
          instance_variable_set "@#{column_name}", value
        end
      end
    end
  end
end
