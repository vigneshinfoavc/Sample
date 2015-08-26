require 'indian_currency'

module CurrencyFormatter
  extend ActiveSupport::Concern

  module ClassMethods
    def monetize(*columns)
      columns.each do |column_name|
        define_method column_name do
          amount = self.instance_variable_get(:@attributes)[column_name.to_s]
          amount = IndianCurrency.new(amount) unless amount.blank?
          instance_variable_set "@#{column_name}", amount
        end
      end
    end
  end
end
