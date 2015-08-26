class IndianCurrency < Money
  INR_CURRENCY = Money::Currency.new('INR')

  def initialize(value)
    super(Money.parse(value).cents, INR_CURRENCY)
  end

  # Set the default bank for creating new +Money+ objects.
  self.default_bank = Bank::VariableExchange.instance

  # Set the default currency for creating new +Money+ object.
  self.default_currency = Currency.new("INR")

  # Default to using i18n
  self.use_i18n = true

  # Default to not using currency symbol assumptions when parsing
  self.assume_from_symbol = false

  # Default to not using infinite precision cents
  self.infinite_precision = false

  # Default to bankers rounding
  self.rounding_mode = BigDecimal::ROUND_HALF_EVEN

  # Default the conversion of Rationals precision to 16
  self.conversion_precision = 16
end

class Money
  def to_s
    format(:south_asian_number_formatting => true, :symbol => false)
  end

  def as_json(options={})
    to_d
  end
end
