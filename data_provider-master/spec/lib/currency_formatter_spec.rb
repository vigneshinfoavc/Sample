require 'spec_helper'

describe CurrencyFormatter do
  class Scheme
    include Mongoid::Document
    include CurrencyFormatter

    field :amount, :type => Float

    monetize :amount
  end

  it "should convert amount to money object" do
    amount_in_paise = 100000 * 100
    scheme = Scheme.new(:amount => 100000)
    scheme.amount.should eq Money.new(10000000, 'INR')
  end
end
