require 'spec_helper'

describe IndianCurrency do
  it "shouldn't raise error when string value pass" do
    lambda{ IndianCurrency.new('1000') }.should_not raise_error
  end

  it "should be a indian rupee" do
    IndianCurrency.new(1000).to_s.should eq '1,000.00'
  end

  it "should parse a string" do
    IndianCurrency.new('1,000').to_s.should eq '1,000.00'
  end

  it "should have #to_currency" do
    a = IndianCurrency.new(10)
    lambda { (a * 2).to_s }.should_not raise_error
  end
end
