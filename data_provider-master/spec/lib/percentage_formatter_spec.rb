require 'spec_helper'

describe PercentageFormatter do
  class Scheme
		include Mongoid::Document
    include PercentageFormatter

    field :percent, :type => Float

    percentize :percent
  end

  it "should convert amount to money object" do
    scheme = Scheme.new(:percent => 12.34)
    scheme.percent.should eq 12.34
	end
end
